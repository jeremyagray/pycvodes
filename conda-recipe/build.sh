#!/bin/bash
export PYCVODES_LAPACK=openblas
# Sundials 2.7:
#export PYCVODES_SUNDIALS_LIBS=sundials_cvodes,sundials_nvecserial

# Sundials 3.1:
export PYCVODES_SUNDIALS_LIBS=sundials_cvodes,sundials_nvecserial,sundials_sunlinsollapackdense,sundials_sunlinsollapackband,sundials_sunlinsolklu,sundials_sunmatrixsparse

cat <<EOF>pycvodes/_config.py
env = {
    'LAPACK': "${PYCVODES_LAPACK}",
    'SUNDIALS_LIBS': "${PYCVODES_SUNDIALS_LIBS}",
    'PYCVODES_NO_KLU': '0',
    'PYCVODES_NO_LAPACK': '1',
    'SUNDIALS_PRECISION': 'double'
}
EOF
export PYCVODES_STRICT=1
python -m pip install --no-deps --ignore-installed .
