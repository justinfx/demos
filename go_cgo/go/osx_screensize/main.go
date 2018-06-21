package main

/*
https://stackoverflow.com/a/41264946/496445
*/

import (
	// #cgo LDFLAGS: -framework CoreGraphics
	// #include <CoreGraphics/CoreGraphics.h>
	"C"

	// Other packages
	"fmt"
)

func main() {
	displayID := C.CGMainDisplayID()
	width := int(C.CGDisplayPixelsWide(displayID))
	height := int(C.CGDisplayPixelsHigh(displayID))
	fmt.Printf("Screen size: %dx%d\n", width, height)
}
