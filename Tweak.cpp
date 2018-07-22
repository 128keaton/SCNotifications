#import <Foundation/Foundation.h>
#import <UserNotifications/UserNotifications.h>

%hook SCAppDelegate
static NSString *snapchatVersion = nil;

-(BOOL)application:(UIApplication*)application
didFinishLaunchingWithOptions:(NSDictionary*)launchOptions{
    
    snapchatVersion = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
    
    UNUserNotificationCenter *center = [UNUserNotificationCenter currentNotificationCenter];
    [center requestAuthorizationWithOptions:(UNAuthorizationOptionSound | UNAuthorizationOptionAlert | UNAuthorizationOptionBadge) completionHandler:^(BOOL granted, NSError * _Nullable error) {
     if (granted) {
     [[UIApplication sharedApplication] registerForRemoteNotifications];
     
     }
     }];
    
    
    NSLog(@"DEBUG:  Just launched application successfully running Snapchat version %@",snapchatVersion);
    HBLogInfo(@"DEBUG: Just launched application successfully running Snapchat version %@",snapchatVersion);
    
    
    return %orig();
}
%end

