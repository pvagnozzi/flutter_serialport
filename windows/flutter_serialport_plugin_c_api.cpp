#include "include/flutter_serialport/flutter_serialport_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "flutter_serialport_plugin.h"

void FlutterSerialportPluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  flutter_serialport::FlutterSerialportPlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
