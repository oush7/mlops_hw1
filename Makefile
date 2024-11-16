CXX=g++
CXXFLAGS=-std=c++11 -O3 -march=native -Wall -I$(SRC_DIR) $(shell python3 -m pybind11 --includes)
PY_LDFLAGS=$(shell python3-config --ldflags) -shared -fPIC
GTEST_FLAGS=-lgtest -lgtest_main -pthread
SRC_DIR=leaky_relu/src
TESTS_DIR=leaky_relu/tests
PYTHON_DIR=leaky_relu/python

all: leaky_relu test

leaky_relu: $(PYTHON_DIR)/bindings.o $(SRC_DIR)/LeakyRelu.o
	$(CXX) $^ -o $(PYTHON_DIR)/leaky_relu_core`python3-config --extension-suffix` $(PY_LDFLAGS) $(CXXFLAGS)

$(PYTHON_DIR)/bindings.o: $(PYTHON_DIR)/bindings.cpp $(SRC_DIR)/LeakyRelu.h
	$(CXX) $(CXXFLAGS) -fPIC -c $< -o $@

$(SRC_DIR)/LeakyRelu.o: $(SRC_DIR)/LeakyRelu.cpp $(SRC_DIR)/LeakyRelu.h
	$(CXX) $(CXXFLAGS) -fPIC -c $< -o $@

test: $(TESTS_DIR)/test_leaky_relu.o $(SRC_DIR)/LeakyRelu.o
	$(CXX) $^ -o $(TESTS_DIR)/test_leaky_relu $(GTEST_FLAGS) $(LDFLAGS)

$(TESTS_DIR)/test_leaky_relu.o: $(TESTS_DIR)/test_leaky_relu.cpp $(SRC_DIR)/LeakyRelu.h
	$(CXX) $(CXXFLAGS) -c $< -o $@

run_tests: test
	./$(TESTS_DIR)/test_leaky_relu

clean:
	rm -f $(PYTHON_DIR)/*.o $(SRC_DIR)/*.o $(TESTS_DIR)/*.o $(PYTHON_DIR)/leaky_relu_core`python3-config --extension-suffix` $(TESTS_DIR)/test_leaky_relu