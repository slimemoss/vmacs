FROM ubuntu:24.04 AS builder

# latest version is here
# https://www.gnu.org/savannah-checkouts/gnu/emacs/emacs.html#Releases
RUN apt-get update \
    && DEBIAN_FRONTEND="noninteractive" TZ="Asia/Tokyo" apt-get install -y \
    curl xz-utils \
    && rm -rf /var/lib/apt/lists/*
RUN curl -LO https://ftp.gnu.org/gnu/emacs/emacs-29.4.tar.xz \
    && tar -xf emacs-29.4.tar.xz && mv emacs-29.4 emacs

# build emacs
RUN apt-get update \
    && DEBIAN_FRONTEND="noninteractive" TZ="Asia/Tokyo" apt-get install -y \
    make autoconf gcc-14 texinfo \
    libgnutls28-dev \
    libncurses5-dev \
    libjpeg-dev libpng-dev libgif-dev libtiff-dev librsvg2-dev libwebp-dev libmagickwand-dev \
    libx11-dev libxpm-dev libotf-dev \
    libgtk-4-dev libwebkit2gtk-4.1-dev \
    libjansson-dev \
    libgccjit-14-dev \
    && rm -rf /var/lib/apt/lists/*
ENV CC=/usr/bin/gcc-14
ENV CXX=/usr/bin/gcc-14
WORKDIR /emacs
RUN ./autogen.sh \
    && ./configure \
    --with-xwidgets --with-json --with-native-compilation --with-imagemagick \
    && make -j4 \
    && make install

FROM ubuntu:24.04

RUN apt-get update \
    && DEBIAN_FRONTEND="noninteractive" TZ="Asia/Tokyo" apt-get install -y \
    libgif7 \
    libxpm4 libsm6 libice6 libxft2 libotf1 libmagickwand-6.q16-7t64 \
    libwebpdecoder3 \
    libgtk-4-1 libwebkit2gtk-4.1-0 \
    libjansson4 \
    libgccjit0 \
    && rm -rf /var/lib/apt/lists/*

RUN apt-get update \
    && DEBIAN_FRONTEND="noninteractive" TZ="Asia/Tokyo" apt-get install -y \
    git curl unzip \
    && rm -rf /var/lib/apt/lists/*

RUN curl -OL https://github.com/yuru7/PlemolJP/releases/download/v2.0.3/PlemolJP_v2.0.3.zip \
    && unzip PlemolJP_v2.0.3.zip -d /usr/share/fonts/ \
    && rm -r PlemolJP_v2.0.3.zip \
    && fc-cache -fv

RUN apt-get update \
    && DEBIAN_FRONTEND="noninteractive" TZ="Asia/Tokyo" apt-get install -y \
    python3.12 python3.12-venv \
    && rm -rf /var/lib/apt/lists/*

COPY --from=builder /usr/local/bin/emacs /usr/local/bin/emacs
COPY --from=builder /usr/local/libexec/emacs /usr/local/libexec/emacs
COPY --from=builder /usr/local/share/emacs /usr/local/share/emacs
COPY --from=builder /emacs/native-lisp /usr/local/native-lisp

RUN mkdir /root/.config
COPY ./mozc/build/usr/lib/mozc/* /usr/lib/mozc/
COPY ./mozc/build/usr/bin/* /usr/bin/
COPY ./mozc/build//usr/share/emacs/site-lisp/emacs-mozc/* /usr/share/emacs/site-lisp/emacs-mozc/

COPY .emacs.d/conf /root/.emacs.d/conf
COPY .emacs.d/early-init.el /root/.emacs.d/early-init.el
COPY .emacs.d/init.el /root/.emacs.d/init.el

CMD ["emacs"]
