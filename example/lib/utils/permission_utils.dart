import 'dart:io';
import 'package:permission_handler/permission_handler.dart';
export 'package:permission_handler/permission_handler.dart';

extension PermissionStatusExtensions on PermissionStatus {
  bool get isNotGranted => isDenied || isPermanentlyDenied;
}

Future<bool> requestPermission(Permission permission) async {
  final status = await permission.status;
  if (!status.isNotGranted) {
    return false;
  }

  final result = await permission.request();
  return !result.isNotGranted;
}

Future<bool> requestPermissions(List<Permission> permissions) async {
  final results = await permissions.request();
  return results.values.every((result) => result.isGranted);
}