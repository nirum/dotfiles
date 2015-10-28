from __future__ import print_function
from time import perf_counter
from IPython.core.magics.execution import _format_time as fmt


class LineWatcher(object):

    def __init__(self):
        self.start_time = 0.0

    def start(self):
        self.start_time = perf_counter()

    def stop(self):
        if self.start_time:
            diff = perf_counter() - self.start_time
            assert diff > 0
            print(u'\u23F1  {}'.format(fmt(diff)))

timer = LineWatcher()


def load_ipython_extension(ip):
    ip.events.register('pre_run_cell', timer.start)
    ip.events.register('post_run_cell', timer.stop)


def unload_ipython_extension(ip):
    ip.events.unregister('pre_run_cell', timer.start)
    ip.events.unregister('post_run_cell', timer.stop)
