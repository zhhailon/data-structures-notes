FROM fedora:32

## Install basic tools.
RUN dnf install -y graphviz xz python3 python3-pip \
    && dnf clean all

## Install pp.
WORKDIR /usr/local/bin
RUN curl -L http://cdelord.fr/pp/pp-linux-x86_64.txz | tar Jxvf -

RUN pip3 install blockdiag --no-cache-dir

WORKDIR /doc

## Run 'pp' by default.
ENTRYPOINT ["pp"]
# ENTRYPOINT [ "sh", "-c" ]
