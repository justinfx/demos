#ifndef _MATH_HH_
#define _MATH_HH_

// math.hh
namespace math {

class Multiplier {

public:
	Multiplier(double start) : m_value(start) {}
	void mult(double x) { m_value *= x; }
	double value() { return m_value; }

private:
	double m_value;
};

} // math

#endif // _MATH_HH_