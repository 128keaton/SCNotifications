#line 1 "Tweak.xm"
#import <Foundation/Foundation.h>
#import <UserNotifications/UserNotifications.h>


#include <substrate.h>
#if defined(__clang__)
#if __has_feature(objc_arc)
#define _LOGOS_SELF_TYPE_NORMAL __unsafe_unretained
#define _LOGOS_SELF_TYPE_INIT __attribute__((ns_consumed))
#define _LOGOS_SELF_CONST const
#define _LOGOS_RETURN_RETAINED __attribute__((ns_returns_retained))
#else
#define _LOGOS_SELF_TYPE_NORMAL
#define _LOGOS_SELF_TYPE_INIT
#define _LOGOS_SELF_CONST
#define _LOGOS_RETURN_RETAINED
#endif
#else
#define _LOGOS_SELF_TYPE_NORMAL
#define _LOGOS_SELF_TYPE_INIT
#define _LOGOS_SELF_CONST
#define _LOGOS_RETURN_RETAINED
#endif

@class SCAppDelegate; 
static BOOL (*_logos_orig$_ungrouped$SCAppDelegate$application$didFinishLaunchingWithOptions$)(_LOGOS_SELF_TYPE_NORMAL SCAppDelegate* _LOGOS_SELF_CONST, SEL, UIApplication*, NSDictionary*); static BOOL _logos_method$_ungrouped$SCAppDelegate$application$didFinishLaunchingWithOptions$(_LOGOS_SELF_TYPE_NORMAL SCAppDelegate* _LOGOS_SELF_CONST, SEL, UIApplication*, NSDictionary*); 

#line 4 "Tweak.xm"

static NSString *snapchatVersion = nil;


static BOOL _logos_method$_ungrouped$SCAppDelegate$application$didFinishLaunchingWithOptions$(_LOGOS_SELF_TYPE_NORMAL SCAppDelegate* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, UIApplication* application, NSDictionary* launchOptions){
    
    snapchatVersion = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
    
    UNUserNotificationCenter *center = [UNUserNotificationCenter currentNotificationCenter];
    [center requestAuthorizationWithOptions:(UNAuthorizationOptionSound | UNAuthorizationOptionAlert | UNAuthorizationOptionBadge) completionHandler:^(BOOL granted, NSError * _Nullable error) {
     if (granted) {
     [[UIApplication sharedApplication] registerForRemoteNotifications];
     
     }
     }];
    
    
    NSLog(@"DEBUG:  Just launched application successfully running Snapchat version %@",snapchatVersion);
    HBLogInfo(@"DEBUG: Just launched application successfully running Snapchat version %@",snapchatVersion);
    
    
    return _logos_orig$_ungrouped$SCAppDelegate$application$didFinishLaunchingWithOptions$(self, _cmd, application, launchOptions);
}


static __attribute__((constructor)) void _logosLocalInit() {
{Class _logos_class$_ungrouped$SCAppDelegate = objc_getClass("SCAppDelegate"); MSHookMessageEx(_logos_class$_ungrouped$SCAppDelegate, @selector(application:didFinishLaunchingWithOptions:), (IMP)&_logos_method$_ungrouped$SCAppDelegate$application$didFinishLaunchingWithOptions$, (IMP*)&_logos_orig$_ungrouped$SCAppDelegate$application$didFinishLaunchingWithOptions$);} }
#line 29 "Tweak.xm"
