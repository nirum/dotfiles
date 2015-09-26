from emoji import emojize

# notification function using terminal-notifier on OS X
def notify(title, message='', sound='default'):
    os.system(emojize("terminal-notifier -title '{}' -message '{}' -sound '{}' \
                      -activate 'com.googlecode.iterm2'"
                      .format(title, message, sound), use_aliases=True))
