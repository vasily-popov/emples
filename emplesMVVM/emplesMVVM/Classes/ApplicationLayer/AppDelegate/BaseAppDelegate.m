//
//  BaseAppDelegate.m
//  Onesti
//
//  Created by Vasily Popov on 10/9/17.
//  Copyright © 2017 home.smart. All rights reserved.
//

#import "BaseAppDelegate.h"

@implementation BaseAppDelegate

- (void)applicationDidFinishLaunching:(UIApplication *)application
{
    for (id<ApplicationService> service in _services)
    {
        if([service respondsToSelector:@selector(applicationDidFinishLaunching:)])
        {
            [service applicationDidFinishLaunching:application];
        }
    }
}

- (BOOL)application:(UIApplication *)application willFinishLaunchingWithOptions:(nullable NSDictionary *)launchOptions
{
    BOOL result = NO;
    for (id<ApplicationService> service in _services)
    {
        if([service respondsToSelector:@selector(application: willFinishLaunchingWithOptions:)])
        {
            BOOL respond = [service application:application willFinishLaunchingWithOptions:launchOptions];
            result = result || respond;
        }
    }
    return result;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(nullable NSDictionary *)launchOptions
{
    BOOL result = NO;
    for (id<ApplicationService> service in _services)
    {
        if([service respondsToSelector:@selector(application: didFinishLaunchingWithOptions:)])
        {
            BOOL respond = [service application:application didFinishLaunchingWithOptions:launchOptions];
            result = result || respond;
        }
    }
    return result;
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    for (id<ApplicationService> service in _services)
    {
        if([service respondsToSelector:@selector(applicationDidBecomeActive:)])
        {
            [service applicationDidBecomeActive:application];
        }
    }
}
- (void)applicationWillResignActive:(UIApplication *)application
{
    for (id<ApplicationService> service in _services)
    {
        if([service respondsToSelector:@selector(applicationWillResignActive:)])
        {
            [service applicationWillResignActive:application];
        }
    }
}

- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey, id> *)options
{
    BOOL result = NO;
    for (id<ApplicationService> service in _services)
    {
        if([service respondsToSelector:@selector(application: openURL: options:)])
        {
            BOOL respond = [service application:app openURL:url options:options];
            result = result || respond;
        }
    }
    return result;
}

- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application
{
    for (id<ApplicationService> service in _services)
    {
        if([service respondsToSelector:@selector(applicationDidReceiveMemoryWarning:)])
        {
            [service applicationDidReceiveMemoryWarning:application];
        }
    }
}
- (void)applicationWillTerminate:(UIApplication *)application
{
    for (id<ApplicationService> service in _services)
    {
        if([service respondsToSelector:@selector(applicationWillTerminate:)])
        {
            [service applicationWillTerminate:application];
        }
    }
}
- (void)applicationSignificantTimeChange:(UIApplication *)application
{
    for (id<ApplicationService> service in _services)
    {
        if([service respondsToSelector:@selector(applicationSignificantTimeChange:)])
        {
            [service applicationSignificantTimeChange:application];
        }
    }
}

- (void)application:(UIApplication *)application willChangeStatusBarOrientation:(UIInterfaceOrientation)newStatusBarOrientation duration:(NSTimeInterval)duration
{
    for (id<ApplicationService> service in _services)
    {
        if([service respondsToSelector:@selector(application: willChangeStatusBarOrientation: duration:)])
        {
            [service application:application willChangeStatusBarOrientation:newStatusBarOrientation duration:duration];
        }
    }
}
- (void)application:(UIApplication *)application didChangeStatusBarOrientation:(UIInterfaceOrientation)oldStatusBarOrientation
{
    for (id<ApplicationService> service in _services)
    {
        if([service respondsToSelector:@selector(application: didChangeStatusBarOrientation:)])
        {
            [service application:application didChangeStatusBarOrientation:oldStatusBarOrientation];
        }
    }
}


- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken
{
    for (id<ApplicationService> service in _services)
    {
        if([service respondsToSelector:@selector(application: didRegisterForRemoteNotificationsWithDeviceToken:)])
        {
            [service application:application didRegisterForRemoteNotificationsWithDeviceToken:deviceToken];
        }
    }
}

- (void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error
{
    for (id<ApplicationService> service in _services)
    {
        if([service respondsToSelector:@selector(application: didFailToRegisterForRemoteNotificationsWithError:)])
        {
            [service application:application didFailToRegisterForRemoteNotificationsWithError:error];
        }
    }
}
/*
- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo fetchCompletionHandler:(void (^)(UIBackgroundFetchResult result))completionHandler
{
    for (id<ApplicationService> service in _services)
    {
        if([service respondsToSelector:@selector(application: didReceiveRemoteNotification: fetchCompletionHandler:)])
        {
            [service application:application didReceiveRemoteNotification:userInfo fetchCompletionHandler:completionHandler];
        }
    }
}

- (void)application:(UIApplication *)application performFetchWithCompletionHandler:(void (^)(UIBackgroundFetchResult result))completionHandler
{
    for (id<ApplicationService> service in _services)
    {
        if([service respondsToSelector:@selector(application: performFetchWithCompletionHandler:)])
        {
            [service application:application performFetchWithCompletionHandler:completionHandler];
        }
    }
}
*/
- (void)application:(UIApplication *)application performActionForShortcutItem:(UIApplicationShortcutItem *)shortcutItem completionHandler:(void(^)(BOOL succeeded))completionHandler
{
    for (id<ApplicationService> service in _services)
    {
        if([service respondsToSelector:@selector(application: performActionForShortcutItem: completionHandler:)])
        {
            [service application:application performActionForShortcutItem:shortcutItem completionHandler:completionHandler];
        }
    }
}


- (void)application:(UIApplication *)application handleEventsForBackgroundURLSession:(NSString *)identifier completionHandler:(void (^)(void))completionHandler
{
    for (id<ApplicationService> service in _services)
    {
        if([service respondsToSelector:@selector(application: handleEventsForBackgroundURLSession: completionHandler:)])
        {
            [service application:application handleEventsForBackgroundURLSession:identifier completionHandler:completionHandler];
        }
    }
}

- (void)application:(UIApplication *)application handleWatchKitExtensionRequest:(nullable NSDictionary *)userInfo reply:(void(^)(NSDictionary * __nullable replyInfo))reply
{
    for (id<ApplicationService> service in _services)
    {
        if([service respondsToSelector:@selector(application: handleWatchKitExtensionRequest: reply:)])
        {
            [service application:application handleWatchKitExtensionRequest:userInfo reply:reply];
        }
    }
}

- (void)applicationShouldRequestHealthAuthorization:(UIApplication *)application
{
    for (id<ApplicationService> service in _services)
    {
        if([service respondsToSelector:@selector(applicationShouldRequestHealthAuthorization:)])
        {
            [service applicationShouldRequestHealthAuthorization:application];
        }
    }
}

- (void)application:(UIApplication *)application handleIntent:(INIntent *)intent completionHandler:(void(^)(INIntentResponse *intentResponse))completionHandler NS_AVAILABLE_IOS(11_0)
{
    for (id<ApplicationService> service in _services)
    {
        if([service respondsToSelector:@selector(application: handleIntent: completionHandler:)])
        {
            [service application:application handleIntent:intent completionHandler:completionHandler];
        }
    }
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    for (id<ApplicationService> service in _services)
    {
        if([service respondsToSelector:@selector(applicationDidEnterBackground:)])
        {
            [service applicationDidEnterBackground:application];
        }
    }
}
- (void)applicationWillEnterForeground:(UIApplication *)application
{
    for (id<ApplicationService> service in _services)
    {
        if([service respondsToSelector:@selector(applicationWillEnterForeground:)])
        {
            [service applicationWillEnterForeground:application];
        }
    }
}

- (BOOL)application:(UIApplication *)application shouldAllowExtensionPointIdentifier:(UIApplicationExtensionPointIdentifier)extensionPointIdentifier
{
    BOOL result = NO;
    for (id<ApplicationService> service in _services)
    {
        if([service respondsToSelector:@selector(application: shouldAllowExtensionPointIdentifier:)])
        {
            BOOL respond = [service application:application shouldAllowExtensionPointIdentifier:extensionPointIdentifier];
            result = result || respond;
        }
    }
    return result;
}

- (BOOL)application:(UIApplication *)application willContinueUserActivityWithType:(NSString *)userActivityType
{
    BOOL result = NO;
    for (id<ApplicationService> service in _services)
    {
        if([service respondsToSelector:@selector(application: willContinueUserActivityWithType:)])
        {
            BOOL respond = [service application:application willContinueUserActivityWithType:userActivityType];
            result = result || respond;
        }
    }
    return result;
}

- (BOOL)application:(UIApplication *)application continueUserActivity:(NSUserActivity *)userActivity restorationHandler:(void(^)(NSArray * __nullable restorableObjects))restorationHandler
{
    BOOL result = NO;
    for (id<ApplicationService> service in _services)
    {
        if([service respondsToSelector:@selector(application: continueUserActivity: restorationHandler:)])
        {
            BOOL respond = [service application:application continueUserActivity:userActivity restorationHandler:restorationHandler];
            result = result || respond;
        }
    }
    return result;
}

- (void)application:(UIApplication *)application didFailToContinueUserActivityWithType:(NSString *)userActivityType error:(NSError *)error
{
    for (id<ApplicationService> service in _services)
    {
        if([service respondsToSelector:@selector(application: didFailToContinueUserActivityWithType: error:)])
        {
            [service application:application didFailToContinueUserActivityWithType:userActivityType error:error];
        }
    }
}

- (void)application:(UIApplication *)application didUpdateUserActivity:(NSUserActivity *)userActivity
{
    for (id<ApplicationService> service in _services)
    {
        if([service respondsToSelector:@selector(application: didUpdateUserActivity:)])
        {
            [service application:application didUpdateUserActivity:userActivity];
        }
    }
}

- (void) application:(UIApplication *)application userDidAcceptCloudKitShareWithMetadata:(CKShareMetadata *)cloudKitShareMetadata NS_AVAILABLE_IOS(10_0)
{
    for (id<ApplicationService> service in _services)
    {
        if([service respondsToSelector:@selector(application: userDidAcceptCloudKitShareWithMetadata:)])
        {
            [service application:application userDidAcceptCloudKitShareWithMetadata:cloudKitShareMetadata];
        }
    }
}

@end



