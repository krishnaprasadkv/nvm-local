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

# Install nvm
RUN git clone https://github.com/creationix/nvm.git $NVM_DIR && \
    cd $NVM_DIR && \
    git checkout `git describe --abbrev=0 --tags`

# Install default version of Node.js
RUN source $NVM_DIR/nvm.sh && \
    nvm install $NODE_VERSION && \
    nvm alias default $NODE_VERSION && \
    nvm use default

# Add nvm.sh to .bashrc for startup...
RUN echo "source ${NVM_DIR}/nvm.sh" > $HOME/.bashrc && \
    source $HOME/.bashrc

ENV NODE_PATH $NVM_DIR/v$NODE_VERSION/lib/node_modules
ENV PATH      $NVM_DIR/v$NODE_VERSION/bin:$PATH
