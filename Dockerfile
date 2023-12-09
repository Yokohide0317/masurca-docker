FROM debian:latest

ARG MASURCA_VER=4.1.0

RUN export DEBIAN_FRONTEND=noninteractive && \
    apt-get update && \
    apt-get install -y --no-install-recommends \
      wget \
      ca-certificates \
      make \
      gcc \
      g++ \
      zlib1g-dev \
      libbz2-dev \
      libboost-all-dev \
      file \
      numactl \
      gawk && \
    apt-get autoremove && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN cd ~ && \
  wget https://github.com/alekseyzimin/masurca/releases/download/v4.1.0/MaSuRCA-4.1.0.tar.gz && \
  tar -xvzf MaSuRCA-4.1.0.tar.gz && \
  rm MaSuRCA-4.1.0.tar.gz && \
  cd MaSuRCA-4.1.0 && \
  sed -i 's/ && cp -a ..\/Flye $DEST//' install.sh && \
  ./install.sh && \
  ln -sf /usr/bin/gawk /usr/bin/awk
  
ENV LC_ALL=C.UTF-8 \
    LANGUAGE=C.UTF-8 \
    LANG=C.UTF-8 \
    PATH="${PATH}:/root/MaSuRCA-4.1.0/bin"
