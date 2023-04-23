FROM ghcr.io/a13xie/arch-builder:latest AS builder
RUN build-aur flamenco-manager

FROM ghcr.io/a13xie/arch-base:latest AS runner
COPY --from=builder /home/builder/built/ /built/
RUN pacman -U --noconfirm --noprogressbar /built/*.pkg.tar.*

WORKDIR /data
CMD /usr/bin/flamenco-manager
