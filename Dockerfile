FROM golang:1.11.1

LABEL maintainer="mlussier@gmail.com"

# Env for apt-get
ENV DEBIAN_FRONTEND noninteractive

# ENV for Node and NPM
ENV NPM_CONFIG_LOGLEVEL info
ENV NODE_VERSION 10.11.0

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
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
#
# NodeJS
# Origionaly taken from https://github.com/nodejs/docker-node/blob/master/10/jessie/Dockerfile
#
RUN set -ex \
  && for key in \
  94AE36675C464D64BAFA68DD7434390BDBE9B9C5 \
  FD3A5288F042B6850C66B31F09FE44734EB7990E \
  71DCFD284A79C3B38668286BC97EC7A07EDE3FC1 \
  DD8F2338BAE7501E3DD5AC78C273792F7D83545D \
  C4F0DFFF4E8C1A8236409D08E73BC641CC11F4C8 \
  B9AE9905FFD7803F25714661B63B535A4C206CA9 \
  56730D5401028683275BD23C23EFEFE93C4CFFFE \
  77984A986EBC2AA786BC0F66B01FBB92821C587A \
  8FCCA13FEF1D0C2E91008E09770F7A9A5AE15600 \
  ; do \
  gpg --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys "$key" || \
  gpg --keyserver hkp://ipv4.pool.sks-keyservers.net --recv-keys "$key" || \
  gpg --keyserver hkp://pgp.mit.edu:80 --recv-keys "$key" ; \
  done

RUN ARCH= && dpkgArch="$(dpkg --print-architecture)" \
  && case "${dpkgArch##*-}" in \
  amd64) ARCH='x64';; \
  ppc64el) ARCH='ppc64le';; \
  s390x) ARCH='s390x';; \
  arm64) ARCH='arm64';; \
  armhf) ARCH='armv7l';; \
  i386) ARCH='x86';; \
  *) echo "unsupported architecture"; exit 1 ;; \
  esac \
  && curl -fsSLO --compressed "https://nodejs.org/dist/v$NODE_VERSION/node-v$NODE_VERSION-linux-$ARCH.tar.xz" \
  && curl -fsSLO --compressed "https://nodejs.org/dist/v$NODE_VERSION/SHASUMS256.txt.asc" \
  && gpg --batch --decrypt --output SHASUMS256.txt SHASUMS256.txt.asc \
  && grep " node-v$NODE_VERSION-linux-$ARCH.tar.xz\$" SHASUMS256.txt | sha256sum -c - \
  && tar -xJf "node-v$NODE_VERSION-linux-$ARCH.tar.xz" -C /usr/local --strip-components=1 --no-same-owner \
  && rm "node-v$NODE_VERSION-linux-$ARCH.tar.xz" SHASUMS256.txt.asc SHASUMS256.txt \
  && ln -s /usr/local/bin/node /usr/local/bin/nodejs

#
# Install dep (latest)
#
RUN go get -u github.com/golang/dep/cmd/dep \
  #
  # NPM Settings and global dependencies
  #
  && /usr/local/bin/npm set progress=false \
  && /usr/local/bin/npm config set loglevel warn \
  #
  # YARN Package Manager
  #
  && npm install yarn prettier -g

#
# Install GoReleaser see: https://goreleaser.com/
#
RUN go get -d github.com/goreleaser/goreleaser \
  && cd $GOPATH/src/github.com/goreleaser/goreleaser \
  && dep ensure -vendor-only \
  && make setup build \
  && go install

