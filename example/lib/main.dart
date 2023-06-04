import 'package:flutter/material.dart';
import 'serial_terminal_app.dart';
import 'utils/permission_utils.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await requestPermissions(Permission.values);
  runApp(const SerialTerminalApp());
}