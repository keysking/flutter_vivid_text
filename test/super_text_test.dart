import 'package:flutter_test/flutter_test.dart';
import 'package:super_text/super_text.dart';
import 'package:super_text/super_text_platform_interface.dart';
import 'package:super_text/super_text_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockSuperTextPlatform 
    with MockPlatformInterfaceMixin
    implements SuperTextPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final SuperTextPlatform initialPlatform = SuperTextPlatform.instance;

  test('$MethodChannelSuperText is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelSuperText>());
  });

  test('getPlatformVersion', () async {
    SuperText superTextPlugin = SuperText();
    MockSuperTextPlatform fakePlatform = MockSuperTextPlatform();
    SuperTextPlatform.instance = fakePlatform;
  
    expect(await superTextPlugin.getPlatformVersion(), '42');
  });
}
