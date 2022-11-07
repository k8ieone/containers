FROM ghcr.io/k8ieone/arch-builder:base

RUN pacman -S --noconfirm --noprogressbar rclone darkhttpd
RUN mkdir /packages

COPY entrypoint.sh /
COPY add-package.sh /
CMD /entrypoint.sh
