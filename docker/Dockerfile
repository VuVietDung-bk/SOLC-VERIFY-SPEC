FROM ubuntu:focal

# TO SPEED UP THE PROCESS MODIFY THE ARCHIVE TO YOUR LOCAL SERVER
RUN sed -i 's|archive.ubuntu.com|vn.archive.ubuntu.com|g' /etc/apt/sources.list

# Generic packages
RUN apt update && DEBIAN_FRONTEND="noninteractive" apt install -y \
  cmake \
  curl \
  git \
  libboost-filesystem-dev \
  libboost-program-options-dev \
  libboost-system-dev \
  libboost-test-dev \
  python3-pip \
  software-properties-common \
  unzip \
  wget

# Python dependencies
RUN pip3 install psutil

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

# Set entrypoint
ENTRYPOINT ["solc-verify.py"]