ARG CUDA_VERSION=12.3.0
FROM docker.io/nvidia/cuda:${CUDA_VERSION}-devel-ubuntu22.04

WORKDIR /usr/local/src
RUN apt-get update && \
    apt-get install --no-install-recommends -y bash git make vim wget g++ ffmpeg curl
RUN git clone https://github.com/ggerganov/whisper.cpp.git -b v1.4.0 --depth 1

# whisper.cpp setup
WORKDIR /usr/local/src/whisper.cpp

RUN make clean
RUN WHISPER_CUBLAS=1 make -j

ENTRYPOINT [ "./volume/transcribe.sh" ] 