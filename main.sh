#!/bin/bash

version_trans() {
	printf "%04d%04d" $(echo "$1" | tr '.' ' ')
}

echo "Welcome to python environment setup in docker"
echo "this application helps you to create a docker pod with python (required version) for you"
echo "enter your required python version"

lower=$(version_trans "3.9")
upper=$(version_trans "3.15")

while true; do
	read version

	# basic shape check first, so version_trans doesn't choke on garbage input
	if [[ ! "$version" =~ ^[0-9]+\.[0-9]+$ ]]; then
		echo "enter the correct version (format: X.Y, e.g. 3.11)"
		continue
	fi

	current=$(version_trans "$version")

	if [[ 10#$current -gt 10#$lower && 10#$current -lt 10#$upper ]]; then
		break
	else
		echo "enter the correct version"
	fi
done

echo "enter the directory name"
read directory

echo "creating directory"
mkdir -p "$directory"
sleep 1

echo "creating the required files"
touch "$directory/main.py" "$directory/requirements.txt"
sleep 1

echo "creating the docker environment"
cat > "$directory/Dockerfile" << EOF
# Use an official, stable Python version as the base
FROM python:${version}-slim

# Set a working directory inside the container
WORKDIR /app

# Copy your project files into the container
COPY requirements.txt main.py ./

RUN pip install --no-cache-dir -r requirements.txt

CMD ["python", "main.py"]
EOF

echo "docker environment created"
sleep 1

echo "do you want to start docker (yes/no)"
read respond

if [[ "$respond" == "yes" ]]; then
	echo "starting docker (you may be prompted for your sudo password)"
	sudo systemctl start docker && sudo systemctl enable docker
	echo "all set"
else
	echo "process terminated"
fi

