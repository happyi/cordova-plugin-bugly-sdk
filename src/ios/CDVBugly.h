#import <Cordova/CDVPlugin.h>

@interface CDVBugly : CDVPlugin {

}
- (void)initSDK:(CDVInvokedUrlCommand*)command;

- (void)setUserId:(CDVInvokedUrlCommand*)command;

- (void)setUserValue:(CDVInvokedUrlCommand*)command;

@end
