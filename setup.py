from setuptools import setup, find_packages
from glob import glob

so_files = glob("leaky_relu/python/leaky_relu_core*.so")

setup(
    name="leaky relu",
    version="0.1",
    packages=find_packages(),
    package_data={
        "leaky_relu": ["python/*.so"],
    },
)
