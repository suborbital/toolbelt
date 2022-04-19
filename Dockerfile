FROM golang:1.18

RUN apt update
RUN apt upgrade -y

RUN groupadd -r masons -g 433 \
    && useradd bricklayer -G masons -u 431

USER bricklayer
WORKDIR /home/bricklayer

# Install golangci-lint v1.45.2. Check latest version available here
# @see https://github.com/golangci/golangci-lint/releases
RUN curl -sSfL https://raw.githubusercontent.com/golangci/golangci-lint/master/install.sh | sh -s -- -b $(go env GOPATH)/bin v1.45.2

# Install gci v0.3.3. Check the latest version available here
# @see https://github.com/daixiang0/gci/releases
RUN go install github.com/daixiang0/gci@v0.3.3

# Install vektra/mockery v2.11.0. Check the latest version available here:
# @see https://github.com/vektra/mockery/releases
RUN go install github.com/vektra/mockery/v2@v2.11.0

RUN golangci-lint --version || exit 1
RUN gci --version || exit 1
RUN mockery --version || exit 1
