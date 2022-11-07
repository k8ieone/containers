FROM ghcr.io/k8ieone/arch-base:latest

# Install packages required for building
RUN pacman -Sy --noconfirm --noprogressbar --needed shadow sudo awk git subversion zip pacman-contrib base-devel

# Install pikaur
RUN cd /home/builder && sudo -u builder git clone https://aur.archlinux.org/pikaur.git
RUN cd /home/builder/pikaur && sudo -u builder makepkg -si --noconfirm && cd .. && rm -r pikaur

# Copy the build script to the container
ADD .arch_build_scripts/build-aur /usr/bin/build-aur
ADD .arch_build_scripts/build-cust /usr/bin/build-cust
ADD .arch_build_scripts/build-local /usr/bin/build-local
