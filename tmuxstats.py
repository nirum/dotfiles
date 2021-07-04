import psutil;

cpu = 100 * psutil.getloadavg()[0] / psutil.cpu_count()
mem = psutil.virtual_memory().percent
batt = psutil.sensors_battery().percent

print(f"  {cpu:0.1f}%   {mem}%   {batt}%")
