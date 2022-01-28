import psutil

cpu = 100 * psutil.getloadavg()[0] / psutil.cpu_count()
mem = psutil.virtual_memory().percent

sensors = psutil.sensors_battery()
batt = f"   {sensors.percent}%" if sensors is not None else ""

print(f"  {cpu:0.1f}%   {mem}%{batt}")
