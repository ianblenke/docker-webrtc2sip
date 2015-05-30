FROM ubuntu:precise
MAINTAINER Ian Blenke <ian@blenke.com>

WORKDIR /opt

RUN apt-get update -y
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y git curl

RUN git clone https://github.com/sous/webrtc2sip-precise
RUN ( echo deb file://`pwd`/webrtc2sip-precise precise main ; \
      echo deb-src file://`pwd`/webrtc2sip-precise precise main ) > /etc/apt/sources.list.d/webrtc2sip-precise.list

RUN curl https://gist.githubusercontent.com/ianblenke/eaaa5a11578ab89f40a4/raw/e96b04e2772a7bb3334cf3866e0ed87f813bfbd4/sous_webrtc2sip.pem | \
    apt-key add -

RUN apt-get update -y
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y webrtc2sip

CMD webrtc2sip

