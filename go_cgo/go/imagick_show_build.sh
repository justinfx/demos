#!/bin/bash

cat << EOF > /dev/null
# START OMIT
go build -x gopkg.in/gographics/imagick.v3/imagick
# END OMIT
EOF

cat << EOF
# Discover and set up compile and linker flags for ImageMagick
pkg-config --cflags -- MagickWand MagickCore
pkg-config --libs -- MagickWand MagickCore
EOF
sleep 1

cat << EOF

CGO_LDFLAGS='
	"-g" "-O2" 
	"-L/Users/justin/temp/ImageMagick/7.0.7-7/lib" 
	"-lMagickWand-7.Q16HDRI" "-lMagickCore-7.Q16HDRI"' 
	/usr/local/Cellar/go/1.10.2/libexec/pkg/tool/darwin_amd64/cgo 
	 	-objdir $WORK/b001/ -importpath gopkg.in/gographics/imagick.v3/imagick -- 
	 		-DMAGICKCORE_HDRI_ENABLE=1 -DMAGICKCORE_QUANTUM_DEPTH=16 
	 		-I/Users/justin/temp/ImageMagick/7.0.7-7/include/ImageMagick-7 
	 		-I $WORK/b001/ 
	 		-g -O2 
	 		./affine_matrix.go ./align_type.go ./alpha_channel_type.go 
	 		./channel_features.go ./channel_statistics.go ./channel_type.go 
	 		...
	 		./resolution_type.go ./resource_type.go ./sparse_color_method.go 
	 		...
...
EOF
sleep 1

cat << EOF

# Generate and compile supporting C source code for each Go source using cgo
clang -I /Users/justin/src/go/src/gopkg.in/gographics/imagick.v3/imagick 
	-fPIC -m64 -pthread -fno-caret-diagnostics -Qunused-arguments -fmessage-length=0 
	-fdebug-prefix-map=$WORK/b001=/tmp/go-build -gno-record-gcc-switches -fno-common 
	-DMAGICKCORE_HDRI_ENABLE=1 -DMAGICKCORE_QUANTUM_DEPTH=16 
	-I/Users/justin/temp/ImageMagick/7.0.7-7/include/ImageMagick-7 
	-I ./ -g -O2 
	-o ./_x001.o 
	-c _cgo_export.c
EOF
sleep .5

cat << EOF

clang -I /Users/justin/src/go/src/gopkg.in/gographics/imagick.v3/imagick 
	-fPIC -m64 -pthread -fno-caret-diagnostics -Qunused-arguments -fmessage-length=0 
	-fdebug-prefix-map=$WORK/b001=/tmp/go-build -gno-record-gcc-switches -fno-common 
	-DMAGICKCORE_HDRI_ENABLE=1 -DMAGICKCORE_QUANTUM_DEPTH=16
	-I/Users/justin/temp/ImageMagick/7.0.7-7/include/ImageMagick-7 
	-I ./ -g -O2 
	-o ./_x002.o 
	-c affine_matrix.cgo2.c
...
EOF
sleep 1

cat << EOF

# Compile Go source, along with generated supporting cgo sources
/usr/local/Cellar/go/1.10.2/libexec/pkg/tool/darwin_amd64/compile 
	-o $WORK/b001/_pkg_.a 
	-p gopkg.in/gographics/imagick.v3/imagick 
	...
	./destroy.go ./font_metrics.go 
	$WORK/b001/_cgo_gotypes.go 
	$WORK/b001/affine_matrix.cgo1.go 
	$WORK/b001/align_type.cgo1.go  
	...
	$WORK/b001/virtual_pixel_method.cgo1.go 
	$WORK/b001/_cgo_import.go
EOF
sleep .5

cat << EOF

# Build a final pkg from Go + C libs and objects
/usr/local/Cellar/go/1.10.2/libexec/pkg/tool/darwin_amd64/pack r 
	$WORK/b001/_pkg_.a 
	$WORK/b001/_x001.o 
	...
	$WORK/b001/_x075.o 
...
EOF
