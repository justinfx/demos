#!/bin/bash

cd "${PWD}/go/mathcpp"
// START OMIT
go build && otool -L mathcpp
// END OMIT