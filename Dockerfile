FROM amazonlinux:latest
LABEL maintainer "nakaDrigo <nakadrigo@gmail.com>"

# Install SO requirements
RUN yum install -y zip make python-pip dos2unix

# Install Py requirements
RUN python -m pip install pip-tools

# required to make pip-compile work
ENV LC_ALL=en_US.utf8

# This is the mount location for the Lambda function directory
VOLUME ["/lambda"]
WORKDIR "/lambda"

# Default entrypoint / command is to package the function
ENTRYPOINT ["make"]
CMD ["package"]
