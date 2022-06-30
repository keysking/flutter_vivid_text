import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'super_text_method_channel.dart';

abstract class SuperTextPlatform extends PlatformInterface {
  /// Constructs a SuperTextPlatform.
  SuperTextPlatform() : super(token: _token);

  static final Object _token = Object();

  static SuperTextPlatform _instance = MethodChannelSuperText();

  /// The default instance of [SuperTextPlatform] to use.
  ///
  /// Defaults to [MethodChannelSuperText].
  static SuperTextPlatform get instance => _instance;
  
  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [SuperTextPlatform] when
  /// they register themselves.
  static set instance(SuperTextPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
