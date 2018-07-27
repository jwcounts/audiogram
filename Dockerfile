FROM ubuntu:18.04

# Install dependencies
RUN apt update --yes && apt upgrade --yes
RUN apt install git nodejs npm \
libcairo2-dev libjpeg-dev libpango1.0-dev libgif-dev libpng-dev build-essential g++ \
ffmpeg \
redis-server --yes

RUN node -v
RUN npm install -g node-gyp
# RUN ln -sf `which nodejs` /usr/bin/node

# Non-privileged user
RUN useradd -m audiogram
USER audiogram
WORKDIR /home/audiogram

# Clone repo
ARG CACHE_DATE=2018-07-26
RUN git clone https://github.com/jwcounts/audiogram.git
WORKDIR /home/audiogram/audiogram

# Install dependencies

RUN npm install

CMD npm start
