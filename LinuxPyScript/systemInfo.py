import psutil
diskPartitions = psutil.disk_partitions(all=False)
for i in diskPartitions:
    mountPoint = i.mountpoint
    percent = psutil.disk_usage('/').percent
    print('MountPoint:%s DiskPercent:%s%%' % (mountPoint, percent))