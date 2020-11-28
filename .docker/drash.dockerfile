FROM debian:stable-slim

RUN apt update -y \
  && apt clean \
  && apt install bash curl unzip -y

RUN apt install -y --no-install-recommends npm \
  && npm install -g npm@latest

RUN curl https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash
RUN chmod +x $HOME/.nvm/nvm.sh
RUN $HOME/.nvm/nvm.sh install 12.18.1

RUN curl -fsSL https://deno.land/x/install/install.sh | DENO_INSTALL=/usr/local sh -s v1.5.1
RUN export DENO_INSTALL="/usr/bin"
RUN export PATH="$DENO_INSTALL/bin:$PATH"
RUN npm rebuild node-sass
