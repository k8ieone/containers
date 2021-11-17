FROM docker.io/k8ieone/arch-builder:base
LABEL org.opencontainers.image.source=https://github.com/k8ieone/containers
LABEL org.opencontainers.image.description Blender 2.93.5

# add the custom repo
RUN sed -i '/^\[core\]/i \[s886\]\nSigLevel = Optional TrustAll\nServer = https://repo.example.com/$arch' /etc/pacman.conf

# Install Blender
RUN pacman -Sy --noconfirm --noprogressbar blender

ENTRYPOINT ["/usr/bin/blender", "-b"]
