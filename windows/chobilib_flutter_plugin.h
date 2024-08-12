#ifndef FLUTTER_PLUGIN_CHOBILIB_FLUTTER_PLUGIN_H_
#define FLUTTER_PLUGIN_CHOBILIB_FLUTTER_PLUGIN_H_

#include <flutter/method_channel.h>
#include <flutter/plugin_registrar_windows.h>

#include <memory>

namespace chobilib_flutter {

class ChobilibFlutterPlugin : public flutter::Plugin {
 public:
  static void RegisterWithRegistrar(flutter::PluginRegistrarWindows *registrar);

  ChobilibFlutterPlugin();

  virtual ~ChobilibFlutterPlugin();

  // Disallow copy and assign.
  ChobilibFlutterPlugin(const ChobilibFlutterPlugin&) = delete;
  ChobilibFlutterPlugin& operator=(const ChobilibFlutterPlugin&) = delete;

  // Called when a method is called on this plugin's channel from Dart.
  void HandleMethodCall(
      const flutter::MethodCall<flutter::EncodableValue> &method_call,
      std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result);
};

}  // namespace chobilib_flutter

#endif  // FLUTTER_PLUGIN_CHOBILIB_FLUTTER_PLUGIN_H_
