#pragma once
#include <vector>

class LeakyRelu {
public:
    static std::vector<double> leakyRelu(const std::vector<double>& a, const double alpha);
};
