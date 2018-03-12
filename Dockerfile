FROM jenkins/jenkins:lts
USER root
RUN apt-get update && \
    apt-get install -y sudo libltdl-dev && \
    apt-get install -y maven && \
    apt-get install -y python && \
    curl -O https://bootstrap.pypa.io/get-pip.py && \
    python get-pip.py --user && \
    ~/.local/bin/pip install awscli && \
    curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash - && \
    apt-get install -y nodejs && npm install -g yarn
# drop back to the regular jenkins user - good practice
# USER jenkins