#include "LeakyRelu.h"
#include <gtest/gtest.h>


TEST(LeakyRelu, leaky_relu) {
	std::vector<double> a = { 1.0, -2.0, 3.0, -4.0, 5.0 };
	const double alpha = 10.0;
	auto result = LeakyRelu::leakyRelu(a, alpha);
	EXPECT_DOUBLE_EQ(result[0],  1.0);
	EXPECT_DOUBLE_EQ(result[1], -20.0);
	EXPECT_DOUBLE_EQ(result[2], 3.0);
	EXPECT_DOUBLE_EQ(result[3], -40.0);
	EXPECT_DOUBLE_EQ(result[4], 5.0);
}

int main(int argc, char** argv) {
	::testing::InitGoogleTest(&argc, argv);
	return RUN_ALL_TESTS();
}