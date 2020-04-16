NAME := grpc-cpp-env
TAG := ubuntu18

GRPC_RELEASE_DEFAULT := v1.28.1
GRPC_RELEASE := $(grpc_release)
# If release is not provided, fallback to the default one
GRPC_RELEASE := $(or $(grpc_release), $(GRPC_RELEASE_DEFAULT))

default:
	$(error Please specify a make target (see README.md))

docker-reset:
	@echo "Clean-up any related image and container"
	docker rm -f ${NAME} || true
	docker image rm ${NAME}:${GRPC_RELEASE} || true

docker-build:
	@echo "Building and tagging image ${NAME}:${GRPC_RELEASE}"
	docker build --build-arg GRPC_RELEASE=${GRPC_RELEASE} -f docker/Dockerfile -t ${NAME}:${GRPC_RELEASE} .

docker-run:
	@echo "Running image ${NAME}:${GRPC_RELEASE} in container ${NAME}, then attaching to it"
	docker run -it --entrypoint /bin/bash --name ${NAME} ${NAME}:${GRPC_RELEASE}

docker-attach:
	@echo "Attach to container ${NAME}"
	docker exec -it ${NAME} /bin/bash

docker-start: docker-build docker-run

docker-restart: docker-reset docker-start
