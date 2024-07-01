import platform
from ppadb.client import Client


def device_name():
    adb = Client(host='localhost', port=5037)
    devices = adb.devices()
    deviceName = []
    for device in devices:
        deviceName.append(device.serial)
    return deviceName

devices = {
    'deviceName':device_name()
}

IS_WIN_DOWS = platform.system() == "Windows"
SYS_PLATFORM = platform.system()