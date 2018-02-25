# % Last Change: Sun Feb 25 12:01:20 AM 2018 CST
# Base Image
FROM alpine:3.7

# Metadata
LABEL maintainer="Tiandao Li <litd99@gmail.com>"

# Installation
RUN	echo "@edge http://dl-cdn.alpinelinux.org/alpine/edge/main" >> /etc/apk/repositories && \
	echo "@community http://dl-cdn.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories && \
	echo "@testing http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories && \
	apk add --update-cache bash && \ 
	wget --quiet --no-check-certificate https://raw.githubusercontent.com/sgerrand/alpine-pkg-glibc/master/sgerrand.rsa.pub -O /etc/apk/keys/sgerrand.rsa.pub && \
	wget --quiet --no-check-certificate https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.27-r0/glibc-2.27-r0.apk -O glibc.apk && \
	wget --quiet --no-check-certificate https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.27-r0/glibc-bin-2.27-r0.apk -O glibc-bin.apk && \
	apk add --no-cache glibc.apk glibc-bin.apk && \
	/usr/glibc-compat/sbin/ldconfig /lib /usr/glibc/usr/lib && \
	wget --quiet --no-check-certificate https://repo.continuum.io/miniconda/Miniconda3-4.3.30-Linux-x86_64.sh -O miniconda.sh && \
	/bin/bash miniconda.sh -bfp /opt/conda && \
	rm -rf glibc*apk miniconda.sh /opt/conda/pkgs/* /root/.conda && \
	rm -rf /var/cache/apk/* /var/lib/apk/lists/* && \
	/opt/conda/bin/conda clean --yes --all

ENV TINI_VERSION v0.17.0
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /usr/bin/tini
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini.asc /usr/bin/tini.asc
RUN chmod +x /usr/bin/tini /usr/bin/tini.asc

ENV LANG=C.UTF-8 LC_ALL=C.UTF-8
ENV PATH /opt/conda/bin:$PATH
ENV SHELL=/bin/bash

# set timezone
RUN apk add --update tzdata && \
	cp /usr/share/zoneinfo/America/Chicago /etc/localtime && \
	echo "America/Chicago" > /etc/timezone && \
	apk del tzdata

ENTRYPOINT [ "/usr/bin/tini", "--" ]
CMD [ "/bin/bash" ]

