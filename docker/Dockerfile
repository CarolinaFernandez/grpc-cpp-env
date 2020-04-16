FROM ubuntu:18.04

ARG GRPC_RELEASE
ENV RELEASE_TAG=$GRPC_RELEASE
ENV BASE_PATH=/opt/grpc

##
# Install requirements
#
RUN apt-get update
RUN apt-get install -y sudo build-essential cmake gcc git pkg-config
## Install openssl (to use instead of boringssl)
RUN apt-get install -y libssl-dev
## Install bash for easier operation in the future
RUN apt-get install -y bash

##
# Download gRPC and initialise submodules so as to later install these
#
WORKDIR /opt
RUN git clone -b $RELEASE_TAG https://github.com/grpc/grpc --recursive
WORKDIR ${BASE_PATH}
RUN git submodule update --init

# Install third-party libraries and then install gRPC
WORKDIR ${BASE_PATH}/test/distrib/cpp
# Remote location for script: https://raw.githubusercontent.com/grpc/grpc/${RELEASE_TAG}/test/distrib/cpp/run_distrib_test_cmake.sh
RUN ./run_distrib_test_cmake.sh

# Get back to the original directory
WORKDIR ${BASE_PATH}
