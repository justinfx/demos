package main

/*
#include <stdio.h>
double sum(double x, double y) {
	fprintf(stderr, "I'm in C!\n");
	return x + y;
}
*/
import "C"
import "fmt"

func Sum(x, y float64) float64 {
	cval := C.sum(C.double(x), C.double(y))
	return float64(cval)
}

func main() {
	x, y := 5.5, 6.4
	val := Sum(x, y)
	fmt.Printf("%v + %v = %v\n", x, y, val)
}
