FROM nvidia/cuda:12.1.1-cudnn8-runtime-ubuntu22.04

# download cuda-compat
RUN apt-get -y update && apt-get install -y wget
RUN wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/cuda-keyring_1.1-1_all.deb
RUN dpkg -i cuda-keyring_1.1-1_all.deb && rm cuda-keyring_1.1-1_all.deb

# install deps
RUN apt-get -y update && apt-get install -y --no-install-recommends \
         python3 \
         wget \
         ca-certificates \
         python3-pip \
         cuda-compat-12.5 \
         ffmpeg && rm -rf /var/lib/apt/lists/* && apt-get clean

# Set environment variables
ENV LD_LIBRARY_PATH="/usr/local/cuda-12.5/compat:${LD_LIBRARY_PATH}"
ENV PYTHONUNBUFFERED=TRUE
ENV PYTHONDONTWRITEBYTECODE=TRUE
ENV PATH="/opt/program:${PATH}"

# install python deps
WORKDIR /opt/program
COPY requirements.txt /opt/program
COPY model.py /opt/program
COPY serve /opt/program

RUN pip3 install -r requirements.txt

# download models
COPY download_model.py /opt/program
RUN python3 download_model.py

