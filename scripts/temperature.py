import pandas as pd
from jetpack.chart import nospines


def get_df(filename):
    df = pd.read_csv(filename, names=['Time', 'P0', 'CPU0', 'CPU1', 'CPU2', 'CPU3', 'CPU4', 'CPU5', 'GPU0', 'GPU1'])
    df.set_index(['Time'], inplace=True)
    pd.to_datetime(df.index, unit='s').tz_localize('utc').tz_convert('US/Pacific')
    return df.set_index(pd.to_datetime(df.index, unit='s').tz_localize('utc').tz_convert('US/Pacific'))


def main():
    filename = '/Users/nirum/Dropbox/temperature.log'
    df = get_df(filename)
    df.plot()
    nospines()
    return df


if __name__ == "__main__":
    df = main()
