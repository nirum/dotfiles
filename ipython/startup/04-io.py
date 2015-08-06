#pretty_printing.py
from pprint import pprint
np.set_printoptions(precision=4,edgeitems=4)
#pd.set_option('display.max_rows', 240)

from emoji import emojize

# notification function using terminal-notifier on OS X
def notify(title, message='', sound='default'):
    os.system(emojize("terminal-notifier -title '{}' -message '{}' -sound '{}' -activate 'com.googlecode.iterm2'"
                      .format(title, message, sound)))
