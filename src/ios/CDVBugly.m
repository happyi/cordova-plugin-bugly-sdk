
#import <Cordova/CDVViewController.h>
#import <Bugly/Bugly.h>
#import "CDVBugly.h"

@implementation CDVBugly

- (void)pluginInitialize
{


}

- (void)initSDK:(CDVInvokedUrlCommand*)command
{
    CDVPluginResult* pluginResult = nil;

    NSDictionary *params = [command.arguments objectAtIndex:0];

    if (!params)
    {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"参数格式错误"];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
        return ;
    }

    BuglyConfig * config = [[BuglyConfig alloc] init];

    if([params objectForKey:@"debug"]) {
        config.debugMode = [[params objectForKey:@"debug"] boolValue];
    }

    if([params objectForKey:@"channel"]) {
        config.channel = [params objectForKey:@"channel"];
    }

    if([params objectForKey:@"version"]) {
        config.version = [params objectForKey:@"version"];
    }

    if([params objectForKey:@"device_id"]) {
        config.deviceIdentifier = [params objectForKey:@"device_id"];
    }

    if([params objectForKey:@"block_monitor_enable"]) {
        config.blockMonitorEnable = [[params objectForKey:@"block_monitor_enable"] boolValue];
    }

    if([params objectForKey:@"block_monitor_timeout"]) {
        config.blockMonitorTimeout = [[params objectForKey:@"block_monitor_timeout"] intValue];
    }


    config.reportLogLevel = BuglyLogLevelInfo;
    NSDictionary * dict = [[NSBundle mainBundle] infoDictionary];
    NSString * appid = [params objectForKey:@"ios_appId"];

    if([params objectForKey:@"develop"]) {
        [Bugly startWithAppId:appid developmentDevice:[[params objectForKey:@"develop"] boolValue] config:config];
    } else {
        [Bugly startWithAppId:appid config:config];
    }

    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@""];

    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}


- (void)setUserId:(CDVInvokedUrlCommand*)command
{
    CDVPluginResult* pluginResult = nil;

    NSDictionary *params = [command.arguments objectAtIndex:0];

    if (!params)
    {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"参数格式错误"];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
        return ;
    }


    NSString *userId = [params objectForKey:@"userId"];

    [Bugly setUserIdentifier:userId];


    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@""];

    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)setUserValue:(CDVInvokedUrlCommand*)command
{
    CDVPluginResult* pluginResult = nil;

    NSDictionary *params = [command.arguments objectAtIndex:0];

    if (!params)
    {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"参数格式错误"];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
        return ;
    }


    NSString *key = [params objectForKey:@"key"];
    NSString *value = [params objectForKey:@"value"];

    [Bugly setUserValue:value forKey:key];


    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@""];

    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

@end
