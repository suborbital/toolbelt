short := $(shell git rev-parse --short HEAD)

build:
	docker build -t gabor/toolbox -f ./Dockerfile .
	docker tag gabor/toolbox gabor/toolbox:$(short)

run:
	docker run -it gabor/toolbox:utility /bin/sh