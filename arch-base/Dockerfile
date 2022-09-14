FROM lopsided/archlinux:latest

# Install packages required for building
RUN pacman -Sy --noconfirm --noprogressbar shadow sudo awk git subversion zip pacman-contrib base-devel

# Enable parallel downloads in pacman's config file
RUN sed -i '/^#.*ParallelDownloads /s/^#//' /etc/pacman.conf

# Enable parallel makes
RUN echo "MAKEFLAGS=-j\$(nproc)" | tee -a /etc/makepkg.conf

# Sort the mirrorlist
RUN mv /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.backup && rankmirrors /etc/pacman.d/mirrorlist.backup > /etc/pacman.d/mirrorlist && rm /etc/pacman.d/mirrorlist.backup

# Do an update afterwards
RUN pacman -Syyu --noconfirm --noprogressbar

# Set up a build user
RUN useradd -m builder
RUN tee -a /etc/sudoers <<<"builder ALL=(ALL) ALL"
RUN tee -a /etc/sudoers <<<"Defaults:builder    !authenticate"

# Install yay
RUN cd /home/builder && sudo -u builder git clone https://aur.archlinux.org/pikaur.git
RUN cd /home/builder/pikaur && sudo -u builder makepkg -si --noconfirm && cd .. && rm -r pikaur

# Copy the build script to the container
ADD .arch_build_scripts/build-aur /usr/bin/build-aur
ADD .arch_build_scripts/build-cust /usr/bin/build-cust
