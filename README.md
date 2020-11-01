# Challenge Description

Scenario: you work for a sports journalism website that is implementing a text classification model. The model classifies which sport a piece of text is about. The data science team has implemented model training code and saved a serialized model. 

Training and saving the model on personal development environments has caused some inconsistencies. The infra team is responsible for standardizing the training environment using Docker.

***

+ Challenge prereqs: [Docker](https://www.docker.com/)

Your task is to standardize the training environment for a machine learning model.

We are providing code that trains the model. Machine learning tasks like model validation and hyperparameter tuning are not important for this challenge. The provided script loads its own data, trains the model, and uses Kensho's open-source serialization library, `special_k`, to serialize the model securely. The script takes one argument: the location at which the model should be stored.

[special_k](https://github.com/kensho-technologies/special_k/blob/master/docs/usage.md#serializing-and-deserializing-models) uses GPG keys to allow downstream users to verify the model's origin. Although not a good security practice, we are providing both public and private keys for this challenge for convenience in the `/gnupg` directory. Make sure to read `special_k`'s documentation for installation instructions.

Tasks for completing this challenge:
+ Write a Dockerfile that uses the python training script (`train.py`) to train and serialize the model. We have provided a starter Dockerfile for you.
+ Write a bash script which will execute the model training and serialization using the Dockerfile. After the script has run, there should be a `models` directory in the `challenge_1` folder that contains the trained model tarball. 
+ Specify versions of python packages in requirements.txt. If you know of other python package management solutions, feel free to implement those.

For full credit, ensure that your code runs, including the python model serialization script, the Dockerfile and the bash script invoking the Dockerfile.

Address the following prompts in 1-3 paragraphs:

+ Describe your solution: what choices did you have to make? Are there particular conventions that you followed, that you consider good practice? Why?
+ What standardization issues are addressed by dockerizing a training environmnent? 
+ What does requirements.txt accomplish? Are there any shortcomings of using pip/requirements.txt to specify package versions? What alternative methods are there?
