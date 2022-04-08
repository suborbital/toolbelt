
build:
	docker build -t gabor/toolbox:utility --no-cache -f ./Dockerfile .

run:
	docker run -it gabor/toolbox:utility /bin/sh