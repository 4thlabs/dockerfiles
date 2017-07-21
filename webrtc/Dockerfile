FROM ubuntu:16.04

ENV WEBRTC_VERSION 59

# Set locale.
RUN apt-get clean && apt-get update
RUN apt-get install locales
RUN locale-gen --no-purge en_US.UTF-8
ENV LC_ALL en_US.UTF-8

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install -qy sudo lsb-release curl git clang build-essential

RUN echo ttf-mscorefonts-installer msttcorefonts/accepted-mscorefonts-eula select true | debconf-set-selections

RUN curl https://chromium.googlesource.com/chromium/src/+/master/build/install-build-deps.sh?format=TEXT | base64 -d > /tmp/install-build-deps.sh
RUN chmod +x /tmp/install-build-deps.sh
RUN /tmp/install-build-deps.sh --no-prompt --no-arm --no-chromeos-fonts --no-nacl

RUN useradd -m media
USER media
ENV HOME /home/media
WORKDIR /home/media

ENV DEPOT_TOOLS /home/media/depot_tools
RUN git clone https://chromium.googlesource.com/chromium/tools/depot_tools.git $DEPOT_TOOLS
ENV PATH $PATH:$DEPOT_TOOLS
RUN echo -e "\n# Add Chromium's depot_tools to the PATH." >> .bashrc
RUN echo "export PATH=\"\$PATH:$DEPOT_TOOLS\"" >> .bashrc

RUN mkdir webrtc
WORKDIR webrtc

RUN fetch --nohooks webrtc
WORKDIR src

RUN git checkout -b dev refs/remotes/branch-heads/$WEBRTC_VERSION
RUN gclient sync

RUN gn gen out/Default --args="is_component_build=false is_debug=false"
RUN ninja -C out/Default
