# default to floating point division
from __future__ import division

# system
import os
import sys

# numpy
import numpy as np
import pandas as pd

# utilities
from jetpack import *

# IPython references
from IPython.core.magic import register_line_magic
_ip = get_ipython()
