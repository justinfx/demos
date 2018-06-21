#!/bin/bash

cat << EOF > /dev/null
# START OMIT
go build -buildmode=c-shared -o libcalc.so calc/export
# END OMIT
EOF

cd "${PWD}/go/ctypes"
GOPATH=$PWD go build -x -buildmode=c-shared -o libcalc.so ./src/calc/export/libcalc.go
ls -1 lib*
