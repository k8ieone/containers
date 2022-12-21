FROM docker.io/alpine:latest

RUN apk add tar curl blender
RUN curl https://flamenco.blender.org/downloads/flamenco-3.1-linux-amd64.tar.gz | tar xz

WORKDIR /data
ENTRYPOINT /flamenco-3.1-linux-amd64/flamenco-manager
