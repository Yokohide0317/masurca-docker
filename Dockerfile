FROM ubuntu:14.04


ENV DEBIAN_FRONTEND    noninteractive
ENV DEBIAN_PRIORITY    critical
ENV DEBCONF_NOWARNINGS yes

RUN     apt-get update
RUN     apt-get install -y build-essential wget python python-dev bzip2 libbz2-dev gawk; \
        apt-get clean all

RUN	wget ftp://ftp.genome.umd.edu/pub/MaSuRCA/v2.2.1/MaSuRCA-2.2.1.tar.gz && \
	tar xvf MaSuRCA-2.2.1.tar.gz && \
	cd MaSuRCA-2.2.1 && \
	./install.sh

ENV	LD_LIBRARY_PATH /MaSuRCA-2.2.1/lib

ENV     PATH            $PATH:/MaSuRCA-2.2.1/bin

WORKDIR /data
