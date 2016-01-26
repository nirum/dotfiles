from __future__ import print_function
from time import perf_counter
from IPython.core.magics.execution import _format_time as fmt
import os


class Timer(object):
    def __init__(self, thresholds=(0.1, 10.0)):
        """
        Timer is a simple class to keep track of elapsed time.

        Parameters
        ----------
        thresholds : float
            Any times below the first threshold (in seconds) are not printed
            Times greater than the second threshold are shown as a desktop notification

        """

        self.start_time = 0.0
        self.theta_print = thresholds[0]
        self.theta_display = thresholds[1]

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

            # print to terminal if greater than the first threshold
            if diff > self.theta_print:
                print(u'\u23F1  {}'.format(fmt(diff)))

            if diff > self.theta_display:
                if os.uname().nodename == 'mbp':
                    cmd = u"terminal-notifier -appIcon https://www.python.org/static/apple-touch-icon-144x144-precomposed.png -sound Submarine -message '\u23F1 {}' -title 'Complete \u2714'".format(fmt(diff))
                    os.system(cmd)


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
