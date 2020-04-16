# C++ environment for gRPC in Docker

The aim of this script is to ease the manual installation of [gRPC](https://github.com/grpc/grpc/) for [C++](https://github.com/grpc/grpc/tree/master/src/cpp) and have a working environment to work with bindings in this language.

This will install all expected binaries (like `grpc_cpp_plugin`) so to properly compile the protobuf files into the C++ server and client and run these.

# Usage

The quickest way to run the image performs a first clean-up round, then builds the image and finally runs the container.
```bash
make grpc_release=v1.28.1 docker-start
```

If you want to run other tasks in a single way (e.g., "build"), follow the same schema using specific targets from the [Makefile](Makefile):
```bash
make grpc_release=v1.28.1 docker-build
``` 

# FAQ

## Why Docker?

VMs (Vagrant) were first used when troubleshooting the issues during the gRPC C++.
However, the VM quickly became corrupt and a more disposable environment was selected.
Other scripts or tools might be added.
