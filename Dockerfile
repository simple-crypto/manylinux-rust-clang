ARG MANYLINUX_BASE
ARG PLATFORM
FROM quay.io/pypa/${MANYLINUX_BASE}_${PLATFORM}
ARG MANYLINUX_BASE
ARG PLATFORM
ARG RUST_VERSION
ARG NTL_VERSION
RUN echo manylinux: $MANYLINUX_BASE
RUN echo rust: $RUST_VERSION
RUN echo platform: $PLATFORM
RUN echo ntl: $NTL_VERSION
RUN dnf -y install clang llvm gmp-devel
RUN cd /root \
    && echo https://static.rust-lang.org/dist/rust-$RUST_VERSION-$PLATFORM-unknown-linux-gnu.tar.gz \
    && curl -O https://static.rust-lang.org/dist/rust-$RUST_VERSION-$PLATFORM-unknown-linux-gnu.tar.gz \
	&& tar xzf rust-$RUST_VERSION-$PLATFORM-unknown-linux-gnu.tar.gz \
	&& rust-$RUST_VERSION-$PLATFORM-unknown-linux-gnu/install.sh --components=rustc,cargo,rust-std-$PLATFORM-unknown-linux-gnu \
	&& rm -rf rust-$RUST_VERSION-$PLATFORM-unknown-linux-gnu \
	&& rm -rf rust-$RUST_VERSION-$PLATFORM-unknown-linux-gnu.tar.gz
RUN cd /root \
    && curl -O https://libntl.org/ntl-$NTL_VERSION.tar.gz \
    && tar xzf ntl-$NTL_VERSION.tar.gz \
    && cd ntl-$NTL_VERSION/src \
    && ./configure \
    && make -j 2 \
    && make install \
    && cd /root \
	&& rm -rf ntl-$NTL_VERSION ntl-$NTL_VERSION.tar.gz

