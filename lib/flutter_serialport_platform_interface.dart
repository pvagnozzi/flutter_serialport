import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'flutter_serialport_method_channel.dart';

abstract class FlutterSerialportPlatform extends PlatformInterface {
  /// Constructs a FlutterSerialportPlatform.
  FlutterSerialportPlatform() : super(token: _token);

  static final Object _token = Object();

  static FlutterSerialportPlatform _instance = MethodChannelFlutterSerialport();

  /// The default instance of [FlutterSerialportPlatform] to use.
  ///
  /// Defaults to [MethodChannelFlutterSerialport].
  static FlutterSerialportPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FlutterSerialportPlatform] when
  /// they register themselves.
  static set instance(FlutterSerialportPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
