# % Last Change: Fri Feb 23 12:00:01 AM 2018 CST
# Base Image
FROM debian:9-slim

# Metadata
LABEL maintainer="Tiandao Li <litd99@gmail.com>"

RUN apt-get update && \
	apt-get install -y --no-install-recommends \
#	bowtie \
#	bowtie2 \
	bzip2 \
#	ca-certificates \
#	datamash \
#	emboss \
#	gawk \
#	git \
#	golang \
#	imagemagick \
#	julia \
#	less \
	libnss-sss \
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
	wget && \
	apt-get clean all && \
	rm -rf /var/lib/apt/lists/* /tmp/* /var/log/dpkg.log /var/tmp/*

RUN wget --quiet --no-check-certificate https://repo.continuum.io/miniconda/Miniconda3-4.3.30-Linux-x86_64.sh -O ~/miniconda.sh && \
	/bin/bash ~/miniconda.sh -bfp /opt/conda && \
	rm ~/miniconda.sh

ENV TINI_VERSION v0.17.0
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /usr/bin/tini
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini.asc /usr/bin/tini.asc
RUN chmod +x /usr/bin/tini /usr/bin/tini.asc
#ADD https://github.com/coherentgraphics/cpdf-binaries/blob/master/Linux-Intel-64bit/cpdf /usr/bin/cpdf
#RUN chmod +x /usr/bin/tini /usr/bin/tini.asc /usr/bin/cpdf

#ENV LANG=C.UTF-8 LC_ALL=C.UTF-8
ENV PATH /opt/conda/bin:$PATH

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

# set timezone
RUN ln -sf /usr/share/zoneinfo/America/Chicago /etc/localtime && \
	echo "America/Chicago" > /etc/timezone

ENTRYPOINT [ "/usr/bin/tini", "--" ]
CMD [ "/bin/bash" ]
#
#ENV CONDA_PATH /opt/conda
#ENV PATH $CONDA_PATH/bin:$PATH
#ENV INSTALLER Miniconda3-4.1.11-Linux-x86_64.sh
#
#RUN apk add --upgrade --no-cache libssl1.0 wget ca-certificates \
#	&& echo "@testing http://nl.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories \
#	&& apk add --no-cache \
#		bash \
#		bzip2 \
#		unzip \
#		sudo \
#		libstdc++ \
#		glib \
#		libxext \
#		libxrender \
#		tini@testing \
#	&& cd /tmp \
#	&& mkdir -p $CONDA_PATH \
#	&& wget "https://raw.githubusercontent.com/sgerrand/alpine-pkg-glibc/master/sgerrand.rsa.pub" -O /etc/apk/keys/sgerrand.rsa.pub \
#	&& wget "https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.23-r3/glibc-2.23-r3.apk" -O glibc.apk \
#	&& wget "https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.23-r3/glibc-bin-2.23-r3.apk" -O glibc-bin.apk \
#	&& apk add --no-cache glibc.apk glibc-bin.apk \
#	&& /usr/glibc-compat/sbin/ldconfig /lib /usr/glibc/usr/lib \
#	&& wget https://repo.continuum.io/miniconda/$INSTALLER \
#	&& /bin/bash $INSTALLER -f -b -p $CONDA_PATH \
#	&& rm $INSTALLER \
#	&& conda update -y conda

#ENTRYPOINT ["/sbin/tini", "--"]

#CMD [ "/bin/bash" ]



#ENV PATH=/conda/bin:$PATH \ 
#	MINICONDA=Miniconda3-latest-Linux-x86_64.sh
#
#RUN apk add --no-cache --update-cache wget bash openssh \
#    && wget -q --no-check-certificate https://repo.continuum.io/miniconda/$MINICONDA \
#    && /bin/bash $MINICONDA -b -p /conda \
#    && rm -rf /root/.continuum /conda/pkgs/* \
#    && rm $MINICONDA
#
#CMD ["/bin/bash"]


##ENV MINICONDA=Miniconda3-latest-Linux-x86_64.sh
#ENV MINICONDA=Miniconda3-4.3.30-Linux-x86_64.sh
#ENV PATH /opt/conda/bin:$PATH
#
## Installation
#RUN mkdir -p /opt/conda/pkgs/
#RUN	apk add --update bash openssh-client
#RUN	wget --quiet --no-check-certificate https://repo.continuum.io/miniconda/$MINICONDA && \
#	/bin/sh $MINICONDA -bfp /opt/conda && \
##	rm ~/miniconda.sh && \
#	rm -rf /var/lib/apk/lists/* && \
#	rm -rf /var/cache/apk/*
#
##RUN apk update && apk upgrade
#RUN apk add bash
#RUN sed -i -e "s/bin\/ash/bin\/bash/" /etc/passwd


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
