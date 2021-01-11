FROM ubuntu:20.10

# Install base dependencies
RUN apt-get update && apt-get upgrade -y

RUN apt-get install -y curl \
        git \
        vim \
        && apt-get clean

Run curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash && \
     export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")" && \
     [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" && \
     nvm install 6.11.3 && \
     nvm use 6.11.3 && \
     npm install -g nrm yarn && \
     nrm use taobao
CMD ["node"]
