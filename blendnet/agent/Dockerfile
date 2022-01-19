FROM ghcr.io/satcom886/blender:latest

# Install some utils
RUN pacman -Sy --noconfirm --noprogressbar wget unzip && wget https://github.com/state-of-the-art/BlendNet/releases/download/v0.3.10/blendnet-0.3.10.zip && unzip blendnet-0.3.10.zip && rm blendnet-0.3.10.zip && pacman -Rns --noconfirm --noprogressbar wget unzip

WORKDIR /workdir

ENTRYPOINT ["/usr/bin/blender", "-b", "-noaudio", "-P", "/blendnet/agent.py"]
