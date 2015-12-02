from __future__ import print_function
from time import perf_counter
from IPython.core.magics.execution import _format_time as fmt


class Timer(object):
    """
    Timer is a simple class to keep track of elapsed time.

    """

    def __init__(self):
        self.start_time = 0.0

    def start(self):
        """
        Start the timer
        uses the `perf_counter` function in the `time` module in python3

        """

        self.start_time = perf_counter()

    def stop(self):
        """
        Stops the timer, and prints the elapsed time

        """

        if self.start_time:
            diff = perf_counter() - self.start_time
            assert diff > 0
            print(u'\u23F1  {}'.format(fmt(diff)))


timer = Timer()


def load_ipython_extension(ip):
    """
    On load, start and stop the timer every time a cell is run

    """

    ip.events.register('pre_run_cell', timer.start)
    ip.events.register('post_run_cell', timer.stop)


def unload_ipython_extension(ip):
    """
    On unload, remove the timer

    """

    ip.events.unregister('pre_run_cell', timer.start)
    ip.events.unregister('post_run_cell', timer.stop)
