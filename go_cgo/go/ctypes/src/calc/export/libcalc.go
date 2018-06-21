// calc/export/libcalc.go
package main

import (
	"C"
	"calc"
	"fmt"
)

//export Sum
func Sum(x, y float64) float64 {
	fmt.Println("I'm in Go!")
	return calc.Sum(x, y)
}

// C exported modules need at least an empty main function
func main() {}
