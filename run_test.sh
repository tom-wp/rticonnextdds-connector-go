#!/bin/bash

go get -v github.com/stretchr/testify

if [[ "$OSTYPE" == "linux-gnu" ]]; then
	export LD_LIBRARY_PATH=$PWD/rticonnextdds-connector/lib/x64Linux2.6gcc4.4.5:$LD_LIBRARY_PATH
	go test -v -race -coverprofile=coverage.txt -covermode=atomic
elif [[ "$OSTYPE" == "darwin"* ]]; then
	go test -exec "env DYLD_LIBRARY_PATH=$(dirname "$(greadlink -f "${BASH_SOURCE[0]}")")/rticonnextdds-connector/lib/x64Darwin16clang8.0" -v -race -coverprofile=coverage.txt -covermode=atomic
fi
