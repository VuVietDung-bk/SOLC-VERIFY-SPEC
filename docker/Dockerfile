FROM ubuntu:focal-20240530

# TO SPEED UP THE PROCESS MODIFY THE ARCHIVE TO YOUR LOCAL SERVER
RUN sed -i 's|archive.ubuntu.com|vn.archive.ubuntu.com|g' /etc/apt/sources.list
RUN sed -i 's|security.ubuntu.com|vn.archive.ubuntu.com|g' /etc/apt/sources.list
# Generic packages
RUN apt-get upgrade -y

RUN apt-get update && DEBIAN_FRONTEND="noninteractive" apt-get install -y --no-install-recommends \
  cmake \
  curl \
  git \
  build-essential \
  libboost-filesystem-dev \
  libboost-program-options-dev \
  libboost-system-dev \
  libboost-test-dev \
  build-essential \
  zlib1g-dev \
  libncurses5-dev \
  libgdbm-dev \ 
  libnss3-dev \
  libssl-dev \
  libreadline-dev \
  libffi-dev \
  libsqlite3-dev \
  libbz2-dev \
  software-properties-common \
  unzip \
  wget


# SETUP python 3.11.14
RUN cd /usr/src \
  && wget https://www.python.org/ftp/python/3.11.14/Python-3.11.14.tgz \
  && tar -xzf Python-3.11.14.tgz \
  && cd Python-3.11.14 \
  && ./configure --enable-optimizations --enable-shared --with-ensurepip=install \
  && make -j$(nproc) \
  && make install \
  && ldconfig

# Python dependencies
RUN pip3 install psutil
RUN pip3 install lark
RUN pip3 install slither-analyzer

# CVC4
RUN wget http://cvc4.cs.stanford.edu/downloads/builds/x86_64-linux-opt/cvc4-1.8-x86_64-linux-opt \
  && chmod a+x cvc4-1.8-x86_64-linux-opt \
  && mv cvc4-1.8-x86_64-linux-opt /usr/local/bin/cvc4

# Z3
RUN apt install z3

# Get .NET
RUN wget https://packages.microsoft.com/config/ubuntu/20.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
RUN dpkg -i packages-microsoft-prod.deb
RUN apt update
RUN apt install -y apt-transport-https
RUN apt update
RUN apt install -y dotnet-sdk-3.1

# Get boogie
RUN dotnet tool install --global boogie --version 2.8.18
ENV PATH="${PATH}:/root/.dotnet/tools"

# Get and compile solc-verify
RUN git clone https://github.com/SRI-CSL/solidity.git \
  && cd solidity \
  && git checkout 0.7 \
  && mkdir -p build \
  && cd build \
  && cmake .. -DUSE_Z3=On -DUSE_CVC4=Off \
  && make -j $(nproc)\
  && make install

# Get and compile 