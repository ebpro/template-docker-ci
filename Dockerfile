FROM debian:11-slim

ARG TARGETPLATFORM
ARG BUILDPLATFORM
RUN echo "I am running on $BUILDPLATFORM, building for $TARGETPLATFORM"

ARG DOCKER_CLI_VERSION="23.0.1"
ARG DOCKER_COMPOSE_VERSION="2.17.0"
ARG DOCKER_BUILDX_VERSION="0.10.4"
ARG DOCKER_CONFIG="/usr/local/lib/docker/cli-plugins"


# We need to remove the default `docker-clean` to avoid cache cleaning
RUN --mount=type=cache,target=/var/cache/apt \
 	rm -f /etc/apt/apt.conf.d/docker-clean && \ 
 	apt-get update && \
	apt-get install -qq --yes --no-install-recommends \
		vim && \
	rm -rf /var/lib/apt/lists/*

ENTRYPOINT vim
