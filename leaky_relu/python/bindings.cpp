#include "LeakyRelu.h"
#include <pybind11/pybind11.h>
#include <pybind11/stl.h>

namespace py = pybind11;

PYBIND11_MODULE(leaky_relu_core, m) {
    m.doc() = R"doc(
    LeakyRelu layer.
  )doc";

    py::class_<LeakyRelu>(m, "LeakyRelu")
        .def_static("leakyRelu", &LeakyRelu::leakyRelu, R"doc(
          LeakyReLU layer binding

          Parameters:
            a : list of floats.
            alpha : negative slope.
          Returns:
            list of floats

      )doc");
}