import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:super_text/super_text_method_channel.dart';

void main() {
  MethodChannelSuperText platform = MethodChannelSuperText();
  const MethodChannel channel = MethodChannel('super_text');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
