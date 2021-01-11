FROM ubuntu:20.10

# Install base dependencies
RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y curl \
        git \
        vim \
        && apt-get clean

Run mkdir -p /usr/local/nvm

# nvm environment variables
ENV NVM_DIR /usr/local/nvm
ENV NODE_VERSION 6.11.3

# install nvm
# https://github.com/creationix/nvm#install-script
RUN curl --silent -o- https://raw.githubusercontent.com/creationix/nvm/v0.35.3/install.sh | bash

# install node and npm
RUN source $NVM_DIR/nvm.sh \
    && nvm install $NODE_VERSION \
    && nvm alias default $NODE_VERSION \
    && nvm use default

# add node and npm to path so the commands are available
ENV NODE_PATH $NVM_DIR/v$NODE_VERSION/lib/node_modules
ENV PATH $NVM_DIR/versions/node/v$NODE_VERSION/bin:$PATH

CMD ["node"]
