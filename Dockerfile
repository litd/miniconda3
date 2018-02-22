# % Last Change: Thu Feb 22 11:55:10 AM 2018 CST
# Base Image
FROM alpine:3.7

# Metadata
LABEL maintainer="Tiandao Li <litd99@gmail.com>"

# Installation
RUN apk add bash && \
	wget --quiet https://repo.continuum.io/miniconda/Miniconda3-4.3.30-Linux-x86_64.sh -O ~/miniconda.sh && \
	/bin/bash ~/miniconda.sh -bfp /opt/conda && \
	rm ~/miniconda.sh
	rm -rf /var/lib/apk/lists/* && \
	rm -rf /var/cache/apk/*

#RUN apk update && apk upgrade
#RUN apk add bash
#RUN sed -i -e "s/bin\/ash/bin\/bash/" /etc/passwd
#
#
#apt-get update && \
#	apt-get install -y --no-install-recommends \
#	bowtie \
#	bowtie2 \
#	bzip2 \
#	ca-certificates \
#	datamash \
#	emboss \
#	gawk \
#	git \
#	golang \
#	imagemagick \
#	julia \
#	less \
#	libnss-sss \
#	macs \
#	openssh-client \
#	python-matplotlib \
#	python-pandas \
#	python-seaborn \
#	python-sklearn \
#	python2.7 \
#	python2.7-numpy \
#	python2.7-scipy \
#	r-base \
#	rsync \
#	scala \
#	tmux \
#	tree \
#	vim \
#	wget && \
#	apt-get clean all && \
#	rm -rf /var/lib/apt/lists/* /tmp/* /var/log/dpkg.log /var/tmp/*
#
#RUN wget --quiet https://repo.continuum.io/miniconda/Miniconda3-4.3.30-Linux-x86_64.sh -O ~/miniconda.sh && \
#	/bin/bash ~/miniconda.sh -bfp /opt/conda && \
#	rm ~/miniconda.sh
#
#ENV TINI_VERSION v0.17.0
#ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /usr/bin/tini
#ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini.asc /usr/bin/tini.asc
#ADD https://github.com/coherentgraphics/cpdf-binaries/blob/master/Linux-Intel-64bit/cpdf /usr/bin/cpdf
#RUN chmod +x /usr/bin/tini /usr/bin/tini.asc /usr/bin/cpdf
#
##ENV LANG=C.UTF-8 LC_ALL=C.UTF-8
#ENV PATH /opt/conda/bin:$PATH
#
#RUN conda install -c bioconda bcftools=1.6 && \
#	conda install -c bioconda bedtools=2.27.1 && \
#	conda install -c bioconda bioawk=1.0 && \
#	conda install -c bioconda bwa=0.7.15 && \
#	conda install -c bioconda fastqc=0.11.5 && \
#	conda install -c bioconda gatk4=4.0.1.2 && \
#	conda install -c bioconda htslib=1.7 && \
#	conda install -c bioconda igv=2.4.6 && \
#	conda install -c bioconda samtools=1.7 && \
#	conda install -c bioconda sbt=0.13.12 && \
#	conda install -c bioconda vcftools=0.1.15 && \
#	conda install -c conda-forge biopython ipython matplotlib numpy pandas scikit-learn scipy seaborn && \ 
##	conda update conda && \
#	conda clean --all --yes
#
## bwa 0.7.17, fastqc 0.11.7, bam-readcount 0.8 need perl 5.22.0
##conda install -c anaconda biopython ipython matplotlib numpy pandas scikit-learn scipy seaborn && \ 
##RUN groupadd -r -g 1000 ubuntu && useradd -r -g ubuntu -u 1000 ubuntu
##USER ubuntu # create new user
#
## set timezone
#RUN ln -sf /usr/share/zoneinfo/America/Chicago /etc/localtime && \
#	echo "America/Chicago" > /etc/timezone
#
#ENTRYPOINT [ "/usr/bin/tini", "--" ]
#CMD [ "/bin/bash" ]
#
