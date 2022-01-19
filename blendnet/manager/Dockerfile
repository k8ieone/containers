FROM ghcr.io/satcom886/blender:latest

# Install some utils
RUN pacman -Sy --noconfirm --noprogressbar wget unzip nss-mdns

# This makes mDNS work
RUN sed -i 's/hosts:.*/hosts: files mymachines myhostname mdns_minimal [NOTFOUND=return] resolve [!UNAVAIL=return] dns/g' /etc/nsswitch.conf

RUN wget https://github.com/state-of-the-art/BlendNet/releases/download/v0.3.10/blendnet-0.3.10.zip
RUN unzip blendnet-0.3.10.zip

RUN mkdir /workdir
WORKDIR /workdir

ENTRYPOINT ["/usr/bin/blender", "-b", "-noaudio", "-P", "/blendnet/manager.py"]
