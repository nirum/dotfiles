# matplotlib backend
import matplotlib
import matplotlib.pyplot as plt
import matplotlib.cm as cm
from palettable.tableau import Tableau_10
matplotlib.use('Qt4Agg')

# seaborn options
import seaborn as sns
sns.set(font='sans-serif')
sns.set_style('whitegrid')
sns.set_context('talk', font_scale=1.6)

# color styles
matplotlib.rc('lines', linewidth=3)
matplotlib.rc('axes', color_cycle=Tableau_10.mpl_colors)
matplotlib.rc('font', family='sans-serif')
matplotlib.rc('font', serif='Helvetica Neue')
