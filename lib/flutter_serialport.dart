
import 'flutter_serialport_platform_interface.dart';

class FlutterSerialport {
  Future<String?> getPlatformVersion() {
    return FlutterSerialportPlatform.instance.getPlatformVersion();
  }
}
