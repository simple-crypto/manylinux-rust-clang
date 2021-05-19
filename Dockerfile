ARG MANYLINUX_BASE=manylinux2014
ARG RUST_VERSION=1.51.0
ARG PLATFORM=x86_64
FROM ghcr.io/simple-crypto/${MANYLINUX_BASE}_${PLATFORM}:rust-${RUST_VERSION}
ARG MANYLINUX_BASE
ARG RUST_VERSION
ARG PLATFORM
RUN echo manylinux: $MANYLINUX_BASE
RUN echo rust: $RUST_VERSION
RUN echo platform: $PLATFORM
RUN yum -y install centos-release-scl
RUN yum -y install llvm-toolset-7.0
ENTRYPOINT ["manylinux-entrypoint", "scl", "enable", "llvm-toolset-7.0"]


