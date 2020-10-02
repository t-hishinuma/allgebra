FROM nvidia/cuda:10.2-devel-ubuntu18.04
LABEL maintainer "Toshiaki Hishinuma <hishinuma.toshiaki@gmail.com>"

COPY ubuntu2004.list /etc/apt/sources.list

# workaround for tzdata
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    git zsh tmux \
    make curl \
    gcc-offload-nvptx nvptx-tools g++ gfortran \
    ninja-build \
    nsight-systems-2020.3.2 \
    libopenblas-openmp-dev \
    python3 python3-yaml python3-numpy \
    strace trace-cmd valgrind gdb \
    intel-mkl \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

RUN curl -LO https://github.com/Kitware/CMake/releases/download/v3.18.2/cmake-3.18.2-Linux-x86_64.tar.gz \
 && tar xf cmake-3.18.2-Linux-x86_64.tar.gz \
 && mv cmake-3.18.2-Linux-x86_64/bin/* /usr/bin/ \
 && mv cmake-3.18.2-Linux-x86_64/share/cmake-3.18 /usr/share/ \
 && rm -rf cmake-3.18.2-Linux-x86_64*

# CUDA 10.2 environements
ENV CPATH              /usr/local/cuda-10.2/include
ENV C_INCLUDE_PATH     /usr/local/cuda-10.2/include
ENV CPLUS_INCLUDE_PATH /usr/local/cuda-10.2/include
ENV LIBRARY_PATH       /usr/local/cuda-10.2/lib64

# To validate container is well-constructed
COPY examples/ /examples
