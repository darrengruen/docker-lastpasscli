FROM debian:jessie

RUN apt-get update -y \
  && apt-get --no-install-recommends -yqq install \
		  bash-completion \
		  build-essential \
		  cmake \
		  git \
		  libcurl3 \
		  libcurl3-openssl-dev \
		  libcurl3  \
		  libcurl3-openssl-dev  \
		  libssl1.0.0 \
		  libssl-dev \
		  libxml2 \
		  libxml2-dev  \
		  pkg-config \
		  ca-certificates \
		  xclip \
		  wget \
  && wget https://github.com/lastpass/lastpass-cli/releases/download/v1.3.1/lastpass-cli-1.3.1.tar.gz \
  && tar -xvf lastpass-cli-1.3.1.tar.gz

WORKDIR /lastpass-cli-1.3.1

RUN pwd
RUN ls -Alhtu .
RUN make && make install


ENTRYPOINT [ "lpass" ]
