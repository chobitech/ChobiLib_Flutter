import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'chobilib_flutter_platform_interface.dart';

/// An implementation of [ChobilibFlutterPlatform] that uses method channels.
class MethodChannelChobilibFlutter extends ChobilibFlutterPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('chobilib_flutter');
}
