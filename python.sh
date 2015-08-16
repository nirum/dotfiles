echo "Installing basic tools"
pip3 install -U pip setuptools nose pytest

echo "Installing scientific python"
pip3 install -U numpy scipy pandas scikit-learn scikit-image

echo "Time and Memory profiling tools"
pip3 install -U line-profiler psutil memory_profiler

echo "Graphics and visualization"
pip3 install palettable matplotlib seaborn termcolor

echo "Install Jupyter/IPython (and dependencies)"
pip3 install -U "ipython[all]"
pip3 install -U jupyter

echo "Installing functional tools"
pip3 install -U toolz multipledispatch

echo "Other third-party utilities"
pip3 install -U h5py python-pushover emoji PySide
