#!/usr/bin/env python

# Set cwd for demo
import os
os.chdir(os.path.join(os.getenv("PWD"), "go/ctypes"))

# START OMIT
from ctypes import *

calc = CDLL("libcalc.so")
calc.Sum.argtypes = [c_double, c_double]
calc.Sum.restype = c_double

def main():
	x = 10.512023
	y = 25.22123332
	print "Sum of %s + %s = %s" % (x, y, calc.Sum(x, y))
# END OMIT

if __name__ == '__main__':
	main()
