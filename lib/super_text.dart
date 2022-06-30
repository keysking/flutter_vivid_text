
import 'super_text_platform_interface.dart';

class SuperText {
  Future<String?> getPlatformVersion() {
    return SuperTextPlatform.instance.getPlatformVersion();
  }
}
