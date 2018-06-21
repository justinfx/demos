package main

/*
#include "sum.h"
*/
import "C"
import "fmt"

func Sum(x, y float64) float64 {
	return float64(C.sum(C.double(x), C.double(y)))
}

func main() {
	x, y := 5.5, 6.4
	fmt.Printf("%v + %v = %v\n", x, y, Sum(x, y))
}
