import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'super_text_platform_interface.dart';

/// An implementation of [SuperTextPlatform] that uses method channels.
class MethodChannelSuperText extends SuperTextPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('super_text');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
