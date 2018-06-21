#ifndef _MATH_H_
#define _MATH_H_

// math_shim.h
#ifdef __cplusplus
extern "C" {
#endif

// opaque handle
typedef void Multiplier;

Multiplier* Multiplier_new(double start);
void Multiplier_delete(Multiplier* m);
void Multiplier_mult(Multiplier* m, double x);
double Multiplier_value(Multiplier* m);

#ifdef __cplusplus
}
#endif // __cplusplus

#endif // _MATH_H_