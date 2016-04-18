#!/bin/bash
set -x

if [[ $SIQT_BACKEND == 'PyQt4' ]]; then 
        conda install --yes "PyQT=4.11"
elif [[ $SIQT_BACKEND == 'PyQt5' ]]; then 
    if [[ $TRAVIS_PYTHON_VERSION == "3.4" ]]; then
        conda install -c https://conda.anaconda.org/dsdale24 pyqt5 $DEPS
    else  # Python 3.5
        conda install --yes -c https://conda.anaconda.org/mmcauliffe pyqt5
    fi
elif  [[ $SIQT_BACKEND == 'PySide' ]]; then
    if [[ ${TRAVIS_PYTHON_VERSION:0:1} == 2 ]]; then
        conda install --yes "pyside"
    else
        conda install --yes -c pyzo pyzo-pyside
    fi
fi
