from emoji import emojize

# notification function using terminal-notifier on OS X
def notify(title, message='', sound='default'):
    os.system(emojize("terminal-notifier -title '{}' -message '{}' -sound '{}' -activate 'com.googlecode.iterm2'"
                      .format(title, message, sound), use_aliases=True))

# initialize pushover (for notifications)
import pushover
pushover_client = pushover.Client('VnKXLJ5EfypjQb9GLRkRKV6z63daQf', api_token='ana5qQqVziDwfSw4Lv7AFow7rSFv8r')
