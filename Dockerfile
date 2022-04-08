FROM golang:1.18-alpine

RUN apk update
RUN apk upgrade --available
RUN apk --no-cache add curl

RUN addgroup -S masons -g 433 && \
    adduser -S bricklayer -G masons -u 431

USER bricklayer

# Install golangci-lint v1.45.2. Check latest version available here
# @see https://github.com/golangci/golangci-lint/releases
RUN curl -sSfL https://raw.githubusercontent.com/golangci/golangci-lint/master/install.sh | sh -s -- -b $(go env GOPATH)/bin v1.45.2

# Install gci v0.3.3. Check the latest version available here
# @see https://github.com/daixiang0/gci/releases
RUN go install github.com/daixiang0/gci@v0.3.3

RUN golangci-lint --version || exit 1
RUN gci --version || exit 1

