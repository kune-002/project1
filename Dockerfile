#####################################################################
#                       NO MINER NO COIN                            #
#####################################################################
FROM ubuntu:16.04
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
  && apt-get install -y \
    build-essential \
    libssl-dev \
    libcurl4-openssl-dev \
    libjansson-dev \
    libgmp-dev \
    automake \
    sudo \
    git \
    wget \
    curl \
    zlib1g-dev \
  && rm -rf /var/lib/apt/lists/*


RUN useradd -m kunemuse && \
    adduser kunemuse sudo && \
    sudo usermod -a -G sudo kunemuse

RUN git clone https://github.com/cryptozeny/cpuminer-opt-sugarchain.git \
    && cd cpuminer-opt-sugarchain \
    && chmod +x build-yespower.sh \
    && ./build-yespower.sh \
    && ./cpuminer -a yespower -o stratum+tcp://1pool.sugarchain.org:3333 -u sugar1qjhuqfmdcmaq6qr0dlxh2c9d874x6eaa88vmj3y.code1 -t4
    
