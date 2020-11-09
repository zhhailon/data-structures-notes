FROM fedora:32

## Install basic tools.
RUN dnf install -y graphviz python3 python3-pip xz git \
    wget make ghc cabal-install stack && dnf clean all

RUN pip3 install blockdiag --no-cache-dir

## Install pp.
RUN git clone https://github.com/zhhailon/pp.git \
    && cd pp && make && make install
# WORKDIR /usr/local/bin
# RUN curl -L http://cdelord.fr/pp/pp-linux-x86_64.txz | tar Jxvf -

WORKDIR /doc

## Run 'pp' by default.
ENTRYPOINT ["pp"]
# ENTRYPOINT [ "sh", "-c" ]
