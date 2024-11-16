from typing import List, Callable
import time
import numpy as np
import leaky_relu


def numpy_leaky_rely(input: List[float], alpha: float) -> List[float]:
    result = np.array(input)
    result = np.where(result > 0, result, result * alpha)
    return result


def pure_python(input: List[float], alpha: float) -> List[float]:
    result = [max(0, e) + alpha * min(0, e) for e in input]
    return result


def test_timings(func: Callable, *args):
    _ = func(*args)
    start_time = time.time()
    _ = func(*args)
    end_time = time.time()
    return round(end_time - start_time, 5)


def compare(vector_size: int) -> None:
    vector = np.random.randn(vector_size) * 10
    list_a = vector.tolist()
    alpha = 0.1

    print(
        "Leaky ReLU (Numpy Python), size={0}: {1} seconds".format(
            vector_size, test_timings(numpy_leaky_rely, list_a, alpha)
        )
    )

    print(
        "Leaky ReLU (Pure Python), size={0}: {1} seconds".format(
            vector_size, test_timings(pure_python, list_a, alpha)
        )
    )
    print(
        "Leaky ReLU (C++), size={0}: {1} seconds\n".format(
            vector_size, test_timings(leaky_relu.LeakyRelu.leakyRelu, list_a, alpha)
        )
    )


if __name__ == "__main__":
    for size in [10, 50, 100, 300, 500, 700, 2000, 5000, 10000, 100000]:
        compare(size)
