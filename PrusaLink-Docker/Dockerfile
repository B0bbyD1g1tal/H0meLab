FROM ubuntu:22.04

RUN apt-get update && \
    apt-get install -y \
    --no-install-recommends  \
    --no-install-suggests \
    python3-dev \
    python3-pip \
    git \
    build-essential \
    libcap-dev \
    libmagic1 \
    libturbojpeg \
    libatlas-base-dev

RUN pip install \
    --no-cache-dir \
    git+https://github.com/prusa3d/Prusa-Connect-SDK-Printer.git \
    git+https://github.com/prusa3d/Prusa-Link.git
# sed vs hardcoded user
RUN sed -i 's/"pi"/"root"/' /usr/local/lib/python3.10/dist-packages/prusa/link/config.py

ENTRYPOINT prusalink
