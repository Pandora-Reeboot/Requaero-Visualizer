##
## Makefile for requaero project
##
## Usage:
##
##     make <command>
##
## The commands for the Makefile are:
##

BINARY_NAME=raquaero
GO_BUILD= GOARCH=amd64 GOOS=linux
OUT_DIR=./out
TEST_DIR=./test

##     help:       prints the help statements in the make file
help:
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'

##     all:        call a <clean> <run> and <build> of the requaero project
all: clean build run

##     build:      builds the requaero project
build:
	mkdir -p $(OUT_DIR)
	go build -o $(OUT_DIR)/$(BINARY_NAME)-linux main.go

##     vendor:     updates the vendor if the go.mod file has been updated
vendor:
	go mod tidy
	go mod vendor

##     run:        runs the requaero project, build is a dependency
run: build
	$(OUT_DIR)/$(BINARY_NAME)-linux

##     clean:      clean project and remove .out directory
clean:
	go clean
	rm -rf $(OUT_DIR)

##
##