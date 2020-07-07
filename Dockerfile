FROM ubuntu:18.04
MAINTAINER Gerald Wu <gerald@geraldwu.com>

RUN apt-get update && \
    apt-get install -y \
    bc \
    bison \
    bsdmainutils \
    build-essential \
    ccache \
    curl \
    flex \
    g++-multilib \
    gcc-multilib \
    git \
    gnupg \
    gperf \
    imagemagick \
    jack \
    lib32ncurses5-dev \
    lib32readline-dev \
    lib32z1-dev \
    liblz4-tool \
    libncurses5-dev \
    libsdl1.2-dev \
    libssl-dev \
    libwxgtk3.0-dev \
    libxml2 \
    libxml2-utils \
    lzop pngcrush \
    pngcrush \
    python \
    rsync \
    schedtool \
    squashfs-tools \
    xsltproc \
    zip \
    zlib1g-dev && \
    apt-get clean

RUN useradd --create-home --uid 1000 --shell /bin/bash user
USER user
WORKDIR /home/user

RUN mkdir ~/bin && \
    curl https://storage.googleapis.com/git-repo-downloads/repo > ~/bin/repo && \
    chmod a+x ~/bin/repo && \
    git config --global user.email "peegoo@brain.com" && \
    git config --global user.name "Peegoo Brain"

ENV PATH="/home/user/bin:${PATH}" USER="user" USE_CACHE="1" CCACHE_SIZE="50G" CCACHE_COMPRESS="1"
