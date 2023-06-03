import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'flutter_serialport_platform_interface.dart';

/// An implementation of [FlutterSerialportPlatform] that uses method channels.
class MethodChannelFlutterSerialport extends FlutterSerialportPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('flutter_serialport');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
