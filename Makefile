run: build
	docker build -t ianblenke/webrtc2sip-example example/
	docker run -ti --rm --net=host ianblenke/webrtc2sip-example

build:
	docker build -t ianblenke/webrtc2sip .

