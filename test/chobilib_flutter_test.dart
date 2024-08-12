import 'package:flutter_test/flutter_test.dart';
import 'package:chobilib_flutter/chobilib_flutter.dart';
import 'package:chobilib_flutter/chobilib_flutter_platform_interface.dart';
import 'package:chobilib_flutter/chobilib_flutter_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockChobilibFlutterPlatform
    with MockPlatformInterfaceMixin
    implements ChobilibFlutterPlatform {
}

void main() {
  final ChobilibFlutterPlatform initialPlatform = ChobilibFlutterPlatform.instance;

  test('$MethodChannelChobilibFlutter is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelChobilibFlutter>());
  });
}
