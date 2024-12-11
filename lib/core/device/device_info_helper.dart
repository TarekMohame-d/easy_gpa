import 'package:device_info_plus/device_info_plus.dart';

class KDeviceInfoHelper {
  KDeviceInfoHelper._();
  static final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
  static Future<AndroidDeviceInfo> getAndroidDeviceInfo() async {
    AndroidDeviceInfo androidInfo = await deviceInfoPlugin.androidInfo;
    return androidInfo;
  }
}
