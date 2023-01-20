FROM debian:bullseye

# install required debian packages
RUN apt-get update -y && \
    apt-get install -y \
    # used to install sbcl and quicklisp
    build-essential \
    curl \
    # used in downstream images (rpcq, quilc, qvm)
    cmake \
    git \
    libblas-dev \
    libffi-dev \
    liblapack-dev \
    libz-dev \
    libzmq3-dev \
    # used in the Dockerfile CMD
    rlwrap \
    # used to install sbcl and quicklisp
    sbcl


RUN apt-get install -y \
    # to convert from tex to pdf
    texlive-latex-base \
    texlive-luatex \
    clisp \
    evince \
    tikzit

RUN apt-get install -y \
    # to convert from tex to pdf
    texmaker && \
    mktexlsr



WORKDIR /app

COPY . /app

USER 1000



# docker build -f lisp.Dockerfile -t build-amb ./ && docker run --rm -it --entrypoint bash -v ${PWD}:/app build-amb 
