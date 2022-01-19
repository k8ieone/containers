FROM docker.io/satcom886/arch-builder:base
LABEL org.opencontainers.image.source=https://github.com/satcom886/containers
LABEL org.opencontainers.image.description Blender 2.93.5

# add the custom repo
RUN sed -i '/^\[core\]/i \[s886\]\nSigLevel = Optional TrustAll\nServer = https://repo.mcld.eu/$arch' /etc/pacman.conf

# Install Blender
RUN pacman -Sy --noconfirm --noprogressbar blender wget unzip

RUN wget https://github.com/state-of-the-art/BlendNet/releases/download/v0.3.10/blendnet-0.3.10.zip
RUN unzip blendnet-0.3.10.zip

RUN mkdir /workdir
WORKDIR /workdir

ENTRYPOINT ["/usr/bin/blender", "-b", "-noaudio", "-P /blendnet/master.py"]
