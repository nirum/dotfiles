# default to floating point division
from __future__ import print_function
from __future__ import division

# system
import os
import sys

# numpy and friends
import numpy as np
import pandas as pd
import scipy
import h5py

# utilities
from jetpack import *
import pyret.filtertools as ft
import pyret.visualizations as viz
from pyret.spiketools import binspikes, estfr
from bunch import Bunch

# IPython references
from IPython.core.magic import register_line_magic
_ip = get_ipython()
