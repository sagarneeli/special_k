# The version of python our application image should use
FROM python:3.6-stretch

# Install all the system level dependencies
RUN apt-get update && apt-get upgrade -y && apt-get install -y

# Install the packages necessary to install special_k
# Reference - https://github.com/kensho-technologies/special_k/blob/master/docs/getting_started.md
RUN apt-get install -y gnupg2 libgpgme-dev swig

# The application directory where all the code logic and processing will run
WORKDIR /app

# COPY necessary files and folders from host to the container
COPY requirements.txt .
COPY train.py .
COPY gnupg ./gnupg
COPY text_classifier.py .

# Install all the necessary python packages
RUN pip install -r requirements.txt

ENTRYPOINT ["python", "train.py"]
