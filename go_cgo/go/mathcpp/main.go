// DEF OMIT
package main

/*
#include "math_shim.h"
*/
import "C"
import (
	"fmt"
	"os"
	"unsafe"
)

type Multiplier struct{ ptr unsafe.Pointer }

func NewMultiplier(start float64) *Multiplier {
	return &Multiplier{C.Multiplier_new(C.double(start))}
}

func (m *Multiplier) Destroy() {
	if m.ptr != nil {
		C.Multiplier_delete(m.ptr)
		m.ptr = nil
	}
}

func (m *Multiplier) Mult(x float64) {
	C.Multiplier_mult(m.ptr, C.double(x))
}

func (m *Multiplier) Value() float64 {
	return float64(C.Multiplier_value(m.ptr))
}

// DEF OMIT

// MAIN OMIT
func main() {
	m := NewMultiplier(2)
	defer m.Destroy() // Don't leak C++ memory!

	m.Mult(100.5)
	fmt.Printf("2 * 100.5 = %0.2f\n", m.Value())

	if len(os.Args) == 2 && os.Args[1] == "-crash" {
		var m2 Multiplier
		m2.Value()
	}
}

// MAIN OMIT
