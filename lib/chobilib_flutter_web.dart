// In order to *not* need this ignore, consider extracting the "web" version
// of your plugin as a separate package, instead of inlining it in the same
// package as the core of your plugin.
// ignore: avoid_web_libraries_in_flutter

import 'package:flutter_web_plugins/flutter_web_plugins.dart';
//import 'package:web/web.dart' as web;

import 'chobilib_flutter_platform_interface.dart';

/// A web implementation of the ChobilibFlutterPlatform of the ChobilibFlutter plugin.
class ChobilibFlutterWeb extends ChobilibFlutterPlatform {
  /// Constructs a ChobilibFlutterWeb
  ChobilibFlutterWeb();

  static void registerWith(Registrar registrar) {
    ChobilibFlutterPlatform.instance = ChobilibFlutterWeb();
  }
}
