FROM ubuntu:22.04

ARG MASURCA_VER=4.1.0
LABEL base.image=ubuntu:jammy
LABEL dockerfile.version=1
LABEL software=masurca
LABEL software.version=4.1.0
LABEL description=Genome Assembly and Analysis
LABEL website=https://github.com/alekseyzimin/masurca
LABEL license=https://github.com/alekseyzimin/masurca/blob/master/LICENSE.txt

ENV DEBIAN_FRONTEND noninteractive
ENV DEBIAN_PRIORITY critical
ENV DEBCONF_NOWARNINGS yes

RUN apt-get update
RUN apt-get install -y build-essential wget python python-dev bzip2 libbz2-dev gawk; \
	apt-get clean all


RUN	wget https://github.com/alekseyzimin/masurca/releases/download/v${MASURCA_VER}/MaSuRCA-${MASURCA_VER}.tar.gz && \
	tar xvf MaSuRCA-${MASURCA_VER}.tar.gz && \
	cd MaSuRCA-${MASURCA_VER} && \
	./install.sh

ENV	LD_LIBRARY_PATH /MaSuRCA-${MASURCA_VER}/lib
ENV PATH ${PATH}:/MaSuRCA-${MASURCA_VER}/bin

WORKDIR /data
