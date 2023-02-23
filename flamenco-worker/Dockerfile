FROM ghcr.io/a13xie/arch-builder:latest AS builder
RUN build-aur flamenco-worker

FROM ghcr.io/a13xie/blender:latest AS runner
COPY --from=builder /home/builder/built/ /built/
RUN pacman -U --noconfirm --noprogressbar /built/*.pkg.tar.*
ENTRYPOINT /usr/bin/flamenco-worker
