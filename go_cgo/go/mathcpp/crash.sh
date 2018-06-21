#!/bin/bash

cd "${PWD}/go/mathcpp"
// START OMIT
go build && ./mathcpp -crash
// END OMIT