## ios-sdk
The MyFitnessPal SDK for iOS

## Introduction
The purpose of this document is to provide installation and usage instructions for the MyFitnessPal SDK for iOS.

## Installation
Drag and drop the `MyFitnessPalSDK.framework` into your Xcode project.

## Usage
Update your app delegate to include creation of an `MFPSession` object and a URL handler.

```objc
#import "AppDelegate.h"
#import <MyFitnessPalSDK/MyFitnessPalSDK.h>

@interface AppDelegate ()
@property (nonatomic, strong) MFPSession *mfpSession;
@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  
  self.mfpSession = [[MFPSession alloc] initWithClientId:@"sampleapiclient"
                                         urlSchemeSuffix:nil
                                            responseType:MFPAuthorizationTypeAccessToken
                                                cacheKey:nil];
  
  return YES;
}

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation {
  
  if ([[MFPSession activeSession] handleOpenURL:url]) {
    if ([[MFPSession activeSession] isOpen]) {
      NSLog(@"Session opened");
    }
  }
  
  return TRUE;
}
```

## Setting the URL Type

In order for the native MyFitnessPal iOS app to call back into your app, you'll need to add a `URL Type` to your `Info.plist`. 

Go to Targets -> "target name" -> Info -> URL Types. From there, you can set a target URL. The URL scheme must have a prefix of "mfp". Optionally, if you have multiple apps on the same device, you can have a suffix such as "premium."

Putting it all together, your URL scheme would be `mfp-sampleapiclient-premium`. If you only have one app, then the URL scheme would be `mfp-sampleapiclient`.

## Whitelisting Custom URL Schemas

The SDK uses app to app deep linking which requires use of the `canOpenUrl` method to see if the MyFitnessPal app is installed on your device. The release of iOS 9 introduced security measures against this which require us to now whitelist our custom URL schemas: `mfp` and `mfphd`. 

To do this open up your `Info.plist` file and add an array called `LSApplicationQueriesSchemes`. Then add 2 strings as children called `mfp` and `mfphd`.

## Working with Tokens

In order to make calls to the MyFitnessPal Partner API you need to obtain an `accessToken`. The SDK wraps this up inside the `MFPAccessTokenData` object.

See the following properties on `MFPAccessTokenData`:
* `accessToken`
* `refreshToken`
* `expirationDate`

### Obtaining Tokens

```objc
- (void)openActiveSession:(id)sender {
  [[MFPSession activeSession] openActiveSessionWithScope:@[MFPPermissionTypeDiary] onSuccess:^{
    NSLog(@"Open active session success");
  } onFailure:^(NSError *__autoreleasing *error) {
    NSLog(@"Failed to open active session");
  }];
}
```

### Refreshing Tokens

```objc
- (void)refreshActiveToken:(id)sender {
  [[MFPSession activeSession] refreshAccessTokenOnSuccess:^{
    NSLog(@"Acess token refreshed");
  } onFailure:^(NSError *__autoreleasing *error) {
    NSLog(@"Failed to refresh access token");
  }];
}
```

### Revoking Tokens

```objc
- (void)revokeAccess:(id)sender {
  if ([[MFPSession activeSession] isOpen]) {
    [[MFPSession activeSession] revokeAccessOnSuccess:^{
      NSLog(@"Access revoked");
    } onFailure:^(NSError *__autoreleasing *error) {
      NSLog(@"Failed to revoke access");
    }];
  }
}
```

## Partner API Reference

Once you've obtained an access token you can start making calls to the Partner API to add exercises, read diary data, etc...

TODO: Link to partner docs here...

## License
MyFitnessPalSDK is available under the MIT license. See the LICENSE file for more info.
