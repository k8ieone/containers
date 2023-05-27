FROM docker.io/lopsided/archlinux:latest
LABEL org.opencontainers.image.source = "https://github.com/a13xie/containers"

# Enable parallel downloads in pacman's config file
RUN sed -i '/^#.*ParallelDownloads /s/^#//' /etc/pacman.conf

# Enable multilib
COPY multien /
RUN /multien

# Add repository mirror
COPY repomirror /
RUN /repomirror

# Enable parallel makes
RUN echo "MAKEFLAGS=-j\$(nproc)" | tee -a /etc/makepkg.conf

# Install basic packages
RUN pacman -Sy --noconfirm --noprogressbar --needed pacman-contrib shadow sudo

# Sort the mirrorlist
RUN mv /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.backup && rankmirrors /etc/pacman.d/mirrorlist.backup > /etc/pacman.d/mirrorlist && rm /etc/pacman.d/mirrorlist.backup

# Do an update afterwards
RUN pacman -Syyu --noconfirm --noprogressbar

# Set up a build user
RUN useradd -m builder
RUN tee -a /etc/sudoers <<<"builder ALL=(ALL) ALL"
RUN tee -a /etc/sudoers <<<"Defaults:builder    !authenticate"
