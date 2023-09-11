FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=Etc/UTC

RUN apt-get update \
    && apt-get install -y tzdata \
    && apt-get install -y libnetcdff-dev make git gcc-9 gfortran-9

RUN git clone -b '3.0' --single-branch https://github.com/brodeau/sosie.git /sosie
WORKDIR /sosie

COPY make.macro_gfortran-9_Linux make.macro

RUN make

WORKDIR /sosie/bin

ENTRYPOINT ["/sosie/bin/sosie3.x"]
