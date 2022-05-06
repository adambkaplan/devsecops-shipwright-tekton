
.PHONY: build test test-unit test-cli

default: all

all: build

build:
	go build -o _output/hello main.go 

test: test-unit

test-unit:
	go test ./...
