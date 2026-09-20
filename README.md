Docker Python Setup Script

Sets up a Python project folder with a ready-to-build Dockerfile. Creates main.py, requirements.txt, and a Dockerfile for the Python version you choose.

Setup
Save the script as docker_python_setup.sh
Make it executable: chmod +x docker_python_setup.sh
Run it: ./docker_python_setup.sh
Enter a Python version (e.g. 3.11) and a directory name when prompted
Choose yes if you want it to also start the Docker service

Next step

Build and run the image yourself: cd <directory> && docker build -t myapp . && docker run --rm myapp
