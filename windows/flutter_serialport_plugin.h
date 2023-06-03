#ifndef FLUTTER_PLUGIN_FLUTTER_SERIALPORT_PLUGIN_H_
#define FLUTTER_PLUGIN_FLUTTER_SERIALPORT_PLUGIN_H_

#include <flutter/method_channel.h>
#include <flutter/plugin_registrar_windows.h>

#include <memory>

namespace flutter_serialport {

class FlutterSerialportPlugin : public flutter::Plugin {
 public:
  static void RegisterWithRegistrar(flutter::PluginRegistrarWindows *registrar);

  FlutterSerialportPlugin();

  virtual ~FlutterSerialportPlugin();

  // Disallow copy and assign.
  FlutterSerialportPlugin(const FlutterSerialportPlugin&) = delete;
  FlutterSerialportPlugin& operator=(const FlutterSerialportPlugin&) = delete;

  // Called when a method is called on this plugin's channel from Dart.
  void HandleMethodCall(
      const flutter::MethodCall<flutter::EncodableValue> &method_call,
      std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result);
};

}  // namespace flutter_serialport

#endif  // FLUTTER_PLUGIN_FLUTTER_SERIALPORT_PLUGIN_H_
