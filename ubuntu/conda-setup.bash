#!/bin/bash
conda update -y conda
conda update -y --all
conda install -y cython
conda install -y seaborn
conda install -y pyproj
conda install -y basemap
conda install -y mpld3
conda install -y line_profiler
conda install -y memory_profiler
conda install -y pillow
conda install -y tables
conda install -y numba
conda install -y mpich2
conda install -y mpi4py
conda install -y pymc
conda install -y -c rpy2
conda install -y scikit-learn
conda install -y scilit-image
conda install -y networkx
conda install -y gdal
conda install -y fiona
conda install -y joblib
`pwd`/pip_setup.bash
