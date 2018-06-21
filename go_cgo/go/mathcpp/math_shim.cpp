#include "math_shim.h"
#include "libmath/math.hh"

extern "C" {

Multiplier* Multiplier_new(double start) {
	return static_cast<Multiplier*>(new math::Multiplier(start));
}

void Multiplier_delete(Multiplier* m) {
	delete static_cast<math::Multiplier*>(m);
}

void Multiplier_mult(Multiplier* m, double x) {
	static_cast<math::Multiplier*>(m)->mult(x);
}

double Multiplier_value(Multiplier* m) {
	return static_cast<math::Multiplier*>(m)->value();
}

} // extern "C"