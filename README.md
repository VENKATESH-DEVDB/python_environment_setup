Docker Python Setup Script:

Sets up a Python project folder with a ready-to-build Dockerfile. Creates main.py, requirements.txt, and a Dockerfile for the Python version you choose.

Setup:

clone the repo into your work folder 
move into the folder ("cd python_environment_setup")
give execute access ("chmod +x main.sh")
run the script ("./main.sh")
enter the required data to create the docker environment 

Next step;

Build and run the image yourself: cd <directory> && docker build -t myapp . && docker run --rm myapp
