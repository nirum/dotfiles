# system
import os
import sys
from glob import glob
from os.path import join, expanduser

# numpy
import numpy as np
from numpy.random import rand, randn, shuffle, choice, sample
from numpy import arange, zeros, ones, eye, linspace, pi, inf, nan, cov, array, sqrt, log

# scipy
import scipy
from scipy.stats import kurtosis, skew, zscore

# other
from functools import partial
from collections import defaultdict, deque, namedtuple
from tqdm import trange, tqdm
