#import "SuperTextPlugin.h"
#if __has_include(<super_text/super_text-Swift.h>)
#import <super_text/super_text-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "super_text-Swift.h"
#endif

@implementation SuperTextPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftSuperTextPlugin registerWithRegistrar:registrar];
}
@end
