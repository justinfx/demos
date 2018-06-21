#!/bin/bash

cat << EOF > /dev/null
# START OMIT
go test -c -o out.test && otool -L ./out.test
# END OMIT
EOF

cat << EOF
out.test:
	/usr/lib/libSystem.B.dylib (compatibility version 1.0.0, current version 1252.50.4)
EOF
