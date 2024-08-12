#include "include/chobilib_flutter/chobilib_flutter_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "chobilib_flutter_plugin.h"

void ChobilibFlutterPluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  chobilib_flutter::ChobilibFlutterPlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
