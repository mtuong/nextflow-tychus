FROM ubuntu:15.10

MAINTAINER Chris Dean <cdean11@rams.colostate.edu>

RUN apt-get update && apt-get install -y \
        aufs-tools \
        automake \
        build-essential \
        cmake \
        zlib1g-dev \
        wget \
        git \
        libbz2-dev \
        openjdk-7-jre-headless \
        unzip \
        python \
	trimmomatic \
	libncurses5-dev \
&& rm -rf /var/lib/apt/lists/*

RUN git clone git://github.com/samtools/htslib.git && \
	cd htslib && \
	make install

RUN git clone git://github.com/samtools/bcftools.git && \
	cd bcftools && \
	make && \
	cp bcftools /usr/local/bin

RUN git clone git://github.com/samtools/samtools.git && \
	cd samtools && \
	make install

RUN git clone https://github.com/BenLangmead/bowtie2.git && \
        cd bowtie2 && \
        make && \
        cp bowtie2* /usr/local/bin

RUN git clone https://github.com/cdeanj/coverage_sampler.git && \
	cd coverage_sampler && \
	make && \
	cp csa /usr/local/bin

RUN git clone --recursive https://github.com/ekg/freebayes.git && \
        cd freebayes && \
        make && \
        cp -r bin/* /usr/local/bin