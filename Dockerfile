FROM debian:stable

ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install --assume-yes eatmydata
RUN eatmydata apt-get dist-upgrade
RUN eatmydata apt-get install --assume-yes curl

ARG BUILDROOT_VERSION
WORKDIR /root
RUN curl --location --remote-name "https://github.com/buildroot/buildroot/archive/refs/tags/${BUILDROOT_VERSION}.tar.gz"
RUN mkdir --parents build/root
RUN tar \
    --auto \
    --directory build/root \
    --extract \
    --strip-components=1 \
    --file "${BUILDROOT_VERSION}.tar.gz"
RUN rm "${BUILDROOT_VERSION}.tar.gz"
RUN eatmydata apt-get install --assume-yes \
    bc \
    build-essential \
    cpio \
    file \
    rsync \
    unzip \
    wget \
    ;

RUN apt-get purge --assume-yes eatmydata
RUN apt-get autopurge --assume-yes

COPY --chown=root:root my-package build/root/package/my-package
WORKDIR /root/build/root
RUN make BR2_DEFCONFIG=configs/qemu_x86_defconfig defconfig