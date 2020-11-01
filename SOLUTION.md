## Steps to run the challenge and see the desired output
* Unzip the challenge_1 folder on your local
* Ensure docker is installed and configured in your system - [Docker](https://www.docker.com/)
* Open the terminal and navigate to the root of the challenge_1 directory
* Run the shell script using the command - `sh docker-entrypoint.sh`
* The trained and serialized model will be generated in the folder model of the challenge_1 directory with file name `model_tar.gz`

## Response to the following prompts
+ Describe your solution: what choices did you have to make? Are there particular conventions that you followed, that you consider good practice? Why?
  + I used docker to create an isolated environment to run model classifiers to train and save the serialized model. Because training and saving the model on personal development environments has caused some inconsistencies in the past.
  + Created a script to automate the process of building docker images and running the training model in containerized environment and copying the output to the local host.
  + Added the necessary dependencies and packages through the Dockerfile to make the application work irrespective of any host environment.
  + Followed a convention of using docker commands to specify unique container names and extract the necessary output.
+ What standardization issues are addressed by dockerizing a training environmnent?
  + If the host has docker installed then the application can run and produce the necessary output irrespective of the application environment and associated dependencies.
  + This allows us to run the training script in a standarized way and not worry about setting up configurations or installing enviroment specific dependencies locally or in production
+ What does requirements.txt accomplish? Are there any shortcomings of using pip/requirements.txt to specify package versions? What alternative methods are there?
  + The `requirements.txt` file allows us to make sure all the necessary python packages and associated versions of the given application are installed.
  + The `requirements.txt` file didn't have any specific versions of the packages given. This might create issues further down the line as not specifying the version number will result in the application using the latest one which might be configured to work with some parts of the application code. Hence, the best practice is to usually specify version names for python packages.
  + Installing And Managing Python Dependencies Using Virtualenv
  + Say in future use-case we are running the application on a Ubuntu OS as our docker image. The python version that comes with default Ubuntu might not be compatible with the version of the python needed to run the application. In such cases we can use virtualenv to lock the python version.