FROM golang:1.7.3

MAINTAINER Mark Lussier <mlussier@gmail.com>

# Env for apt-get
ENV DEBIAN_FRONTEND noninteractive

# ENV for Node and NPM
ENV NPM_CONFIG_LOGLEVEL info
ENV NODE_VERSION 7.1.0

# ENV for Glide
ENV GLIDE_VERSION v0.12.3
ENV GLIDE_DOWNLOAD_URL https://github.com/Masterminds/glide/releases/download/$GLIDE_VERSION/glide-$GLIDE_VERSION-linux-amd64.tar.gz
ENV GLIDE_DOWNLOAD_SHA256 0e2be5e863464610ebc420443ccfab15cdfdf1c4ab63b5eb25d1216900a75109
ENV PATH $PATH:/usr/local/glide/linux-amd64


#
# gcc for cgo
#
RUN apt-get update \
  && apt-get upgrade -y \
  && apt-get install -y --no-install-recommends \
    g++ \
    gcc \
    libc6-dev \
    make \
    pkg-config \
    xz-utils\
    software-properties-common \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \

  #
  # NodeJS
  # Origionaly taken from https://github.com/nodejs/docker-node/blob/master/6.8/Dockerfile
  #

  && set -ex \
  && for key in \
    9554F04D7259F04124DE6B476D5A82AC7E37093B \
    94AE36675C464D64BAFA68DD7434390BDBE9B9C5 \
    0034A06D9D9B0064CE8ADF6BF1747F4AD2306D93 \
    FD3A5288F042B6850C66B31F09FE44734EB7990E \
    71DCFD284A79C3B38668286BC97EC7A07EDE3FC1 \
    DD8F2338BAE7501E3DD5AC78C273792F7D83545D \
    B9AE9905FFD7803F25714661B63B535A4C206CA9 \
    C4F0DFFF4E8C1A8236409D08E73BC641CC11F4C8 \
  ; do \
    gpg --keyserver ha.pool.sks-keyservers.net --recv-keys "$key"; \
  done \
  && curl -SLO "https://nodejs.org/dist/v$NODE_VERSION/node-v$NODE_VERSION-linux-x64.tar.xz" \
  && curl -SLO "https://nodejs.org/dist/v$NODE_VERSION/SHASUMS256.txt.asc" \
  && gpg --batch --decrypt --output SHASUMS256.txt SHASUMS256.txt.asc \
  && grep " node-v$NODE_VERSION-linux-x64.tar.xz\$" SHASUMS256.txt | sha256sum -c - \
  && tar -xJf "node-v$NODE_VERSION-linux-x64.tar.xz" -C /usr/local --strip-components=1 \
  && rm "node-v$NODE_VERSION-linux-x64.tar.xz" SHASUMS256.txt.asc SHASUMS256.txt \
  && ln -s /usr/local/bin/node /usr/local/bin/nodejs \

  #
  # GLIDE
  # Origionaly taken from https://github.com/calavera/go-glide-docker/blob/master/Dockerfile
  #

  &&  curl -fsSL "$GLIDE_DOWNLOAD_URL" -o glide.tar.gz \
  && echo "$GLIDE_DOWNLOAD_SHA256  glide.tar.gz" | sha256sum -c - \
  && mkdir -p /usr/local/glide \
  && tar -C /usr/local/glide -xzf glide.tar.gz \
  && rm glide.tar.gz \
  && go get -u github.com/Masterminds/glide-report \

  #
  # NPM Settings and global dependencies
  #

  && /usr/local/bin/npm set progress=false \
  && /usr/local/bin/npm config set loglevel warn \

  #
  # YARN Package Manager
  #
  && npm install yarn -g
