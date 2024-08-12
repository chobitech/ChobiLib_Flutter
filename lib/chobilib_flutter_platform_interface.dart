import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'chobilib_flutter_method_channel.dart';

abstract class ChobilibFlutterPlatform extends PlatformInterface {
  /// Constructs a ChobilibFlutterPlatform.
  ChobilibFlutterPlatform() : super(token: _token);

  static final Object _token = Object();

  static ChobilibFlutterPlatform _instance = MethodChannelChobilibFlutter();

  /// The default instance of [ChobilibFlutterPlatform] to use.
  ///
  /// Defaults to [MethodChannelChobilibFlutter].
  static ChobilibFlutterPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [ChobilibFlutterPlatform] when
  /// they register themselves.
  static set instance(ChobilibFlutterPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }
}
