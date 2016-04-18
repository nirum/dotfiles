from __future__ import print_function
import time
import os
LOGDIR = os.path.expanduser('~/logs/ipython')
IGNORE = {
    'exact': ('ls', 'pwd', 'whos'),
    'start': ('plt', 'cd', 'print', 'mkdir', '!', '%', 'close'),
    'end': ('shape', '?'),
}
VERSION = '0.0.2'
DEBUG = False


def isvalid(code):
    """Determines if the code fragment should be logged or not

    Parameters
    ----------
    code : str
        A code snippet

    Returns
    -------
    valid : bool
        Whether or not this code snippet should be logged to the log file
    """
    if code in IGNORE['exact']:
        return False

    if any(code.startswith(s) for s in IGNORE['start']):
        return False

    if any(code.endswith(s) for s in IGNORE['end']):
        return False

    return True


class Loggerhead:
    """Docstring for Loggerhead. """

    def __init__(self, ip):
        """TODO: to be defined1. """
        self.shell = ip
        self.history = ip.history_manager

        # make the logfile
        self.folder = time.strftime('%Y-%m')
        if not os.path.exists(os.path.join(LOGDIR, self.folder)):
            print('Creating directory for {}'.format(self.folder))
            os.makedirs(os.path.join(LOGDIR, self.folder))

        self.filename = '{}.{}.log'.format(time.strftime('%d.%A'), os.uname().sysname)
        self.fullpath = os.path.join(LOGDIR, self.folder, self.filename)

        # make the file if necessary
        if not os.path.exists(self.fullpath):
            with open(self.fullpath, 'x') as f:
                lines = [time.strftime('%B %d, %Y'),
                         os.uname().sysname,
                         'Loggerhead v{}'.format(VERSION)]
                f.write('\n'.join(lines))

        # entry message
        print('Logging history to {}'.format(self.fullpath))

    def start(self):
        pass

    def stop(self):
        """Logs the previous IPython command to a file"""
        # get the previous session, line, and code
        session, line, code = next(self.history.get_range(start=-1))

        if isvalid(code):
            with open(self.fullpath, 'a') as f:

                # debug
                if DEBUG:
                    print('Logging [{}] {}'.format(line, code))

                # write to the log file
                f.write('\n# {}\n{}'.format(time.strftime('%I:%M:%S %p'), code))


def load_ipython_extension(ip):
    """On load"""
    log = Loggerhead(ip)
    # ip.events.register('pre_run_cell', log.start)
    ip.events.register('post_run_cell', log.stop)


# def unload_ipython_extension(ip):
    # """On unload"""
    # ip.events.unregister('pre_run_cell', start)
    # ip.events.unregister('post_run_cell', stop)
