#include "LeakyRelu.h"
#include <vector>
#include <iostream>


std::vector<double>LeakyRelu::leakyRelu(const std::vector<double> &a, const double alpha) {

	std::vector<double> result = a;
	for (size_t i = 0; i < a.size(); ++i) {
		result[i] = std::max(0.0, a[i]) + alpha * std::min(0.0, a[i]);
	}
	return result;
}