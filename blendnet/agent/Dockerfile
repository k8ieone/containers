FROM docker.io/satcom886/blender:latest

# Install some utils
RUN pacman -Sy --noconfirm --noprogressbar wget unzip

RUN wget https://github.com/state-of-the-art/BlendNet/releases/download/v0.3.10/blendnet-0.3.10.zip
RUN unzip blendnet-0.3.10.zip

RUN mkdir /workdir
WORKDIR /workdir

ENTRYPOINT ["/usr/bin/blender", "-b", "-noaudio", "-P", "/blendnet/agent.py"]
