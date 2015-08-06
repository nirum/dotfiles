echo "Installing basic tools"
pip3 install -U pip setuptools nose

echo "Installing scientific python"
pip3 install -U numpy scipy pandas scikit-learn scikit-image

echo "Graphics and visualization"
pip3 install palettable matplotlib seaborn

echo "Install IPython (and dependencies)"
pip3 install -U "ipython[all]"

echo "Installing functional tools"
pip3 install -U toolz multipledispatch

echo "Third-party utilities"
pip3 install -U h5py python-pushover emoji PySide
