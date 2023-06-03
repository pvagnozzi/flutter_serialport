import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_serialport/flutter_serialport.dart';
import 'package:flutter_serialport/flutter_serialport_platform_interface.dart';
import 'package:flutter_serialport/flutter_serialport_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockFlutterSerialportPlatform
    with MockPlatformInterfaceMixin
    implements FlutterSerialportPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final FlutterSerialportPlatform initialPlatform = FlutterSerialportPlatform.instance;

  test('$MethodChannelFlutterSerialport is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelFlutterSerialport>());
  });

  test('getPlatformVersion', () async {
    FlutterSerialport flutterSerialportPlugin = FlutterSerialport();
    MockFlutterSerialportPlatform fakePlatform = MockFlutterSerialportPlatform();
    FlutterSerialportPlatform.instance = fakePlatform;

    expect(await flutterSerialportPlugin.getPlatformVersion(), '42');
  });
}
