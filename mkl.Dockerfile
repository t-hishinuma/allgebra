# Copyright 2020 RICOS Co. Ltd.
#
# This file is a part of ricosjp/allgebra, distributed under Apache-2.0 License
# https://github.com/ricosjp/allgebra
#

RUN apt-get update && apt-get install -y \
    intel-mkl \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*
