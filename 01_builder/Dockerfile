FROM ghcr.io/k8ieone/arch-base:latest

# Install packages required for building
RUN pacman -Sy --noconfirm --noprogressbar --needed awk git subversion zip base-devel libxml2

# Install pikaur
RUN cd /home/builder && sudo -u builder git clone https://aur.archlinux.org/pikaur.git
RUN cd /home/builder/pikaur && ulimit -n 1024000 && sudo -u builder makepkg -si --noconfirm && cd .. && rm -r pikaur

# Install paru
RUN cd /home/builder && sudo -u builder git clone https://aur.archlinux.org/paru.git
RUN cd /home/builder/paru && ulimit -n 1024000 && sudo -u builder makepkg -si --noconfirm && cd .. && rm -r paru

# Copy the build script to the container
ADD .arch_build_scripts/build-aur /usr/local/bin/build-aur
ADD .arch_build_scripts/build-cust /usr/local/bin/build-cust
ADD .arch_build_scripts/build-local /usr/local/bin/build-local
