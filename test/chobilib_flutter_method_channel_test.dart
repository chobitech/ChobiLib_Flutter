import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:chobilib_flutter/chobilib_flutter_method_channel.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  MethodChannelChobilibFlutter platform = MethodChannelChobilibFlutter();
  const MethodChannel channel = MethodChannel('chobilib_flutter');

  setUp(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(
      channel,
      (MethodCall methodCall) async {
        return '42';
      },
    );
  });

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(channel, null);
  });
}
