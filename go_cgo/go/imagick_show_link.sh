#!/bin/bash

cat << EOF > /dev/null
# START OMIT
go test -c -o out.test && otool -L ./out.test
# END OMIT
EOF

cat << EOF
out.test:
	/Users/justin/temp/ImageMagick/7.0.7-7/lib/libMagickWand-7.Q16HDRI.4.dylib (compatibility version 5.0.0, current version 5.0.0)
	/Users/justin/temp/ImageMagick/7.0.7-7/lib/libMagickCore-7.Q16HDRI.4.dylib (compatibility version 5.0.0, current version 5.0.0)
	/usr/lib/libSystem.B.dylib (compatibility version 1.0.0, current version 1252.50.4)
EOF
