from emoji import emojize
from pushover import Client
from contextlib import contextmanager
import sys

# notification function using terminal-notifier on OS X
def notify(title, message='', sound='default'):
    os.system(emojize("terminal-notifier -title '{}' -message '{}' -sound '{}' \
                      -activate 'com.googlecode.iterm2'"
                      .format(title, message, sound), use_aliases=True))

def push(messsage, title=''):
    """
    Send a notification via pushover

    Parameters
    ----------
    message : string

    title : string, optional

    """
    Client().send_message(pem(message), title=pem(title))

def pem(message):
    """
    Print an emoijized string

    Parameters
    ----------
    message : string

    """
    print(emojize(message, use_aliases=True))


class Spinner:

    def __init__(self, chars='|/-\\'):
        self.chars = chars
        self.generator = iter(self)

    def __iter__(self):
        while True:
            for cursor in self.chars:
                yield cursor

    def __call__(self):
        sys.stdout.write(next(self.generator))
        sys.stdout.flush()
        sys.stdout.write('\b')
