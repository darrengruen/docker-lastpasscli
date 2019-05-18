FROM debian:buster

WORKDIR /tmp/lpass

RUN apt-get update -y \
	&& apt-get --no-install-recommends -yqq install \
	bash-completion=1:2.8-6 \
	build-essential=12.6 \
	cmake=3.13.4-1 \
	libcurl4-openssl-dev=7.64.0-3  \
	libssl1.1=1.1.1b-2 \
	libssl-dev=1.1.1b-2 \
	libxml2=2.9.4+dfsg1-7+b3 \
	libxml2-dev=2.9.4+dfsg1-7+b3 \
	pkg-config=0.29-6 \
	ca-certificates=20190110 \
	xclip=0.13-1 \
	wget=1.20.1-1.1 \
	&& wget https://github.com/lastpass/lastpass-cli/releases/download/v1.3.1/lastpass-cli-1.3.1.tar.gz \
	&& tar -xvf lastpass-cli-1.3.1.tar.gz \
	&& rm -f lastpass-cli-1.3.1.tar.gz \
	&& mv lastpass-cli-1.3.1/* . \
	&& make \
	&& make install \
	&& useradd -m lpass \
	&& apt-get remove -y \
	build-essential \
	cmake \
	pkg-config \
	wget \
	&& rm -f /var/lib/apt/lists/*

USER lpass
VOLUME [ "/home/lpass/.lpass" ]
WORKDIR /home/lpass

CMD [ "--help" ]
ENTRYPOINT [ "/usr/bin/lpass" ]
