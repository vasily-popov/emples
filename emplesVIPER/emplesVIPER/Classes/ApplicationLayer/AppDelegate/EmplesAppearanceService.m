//
//  EmplesAppearanceService.m
//  emplesMVC
//
//  Created by Vasily Popov on 10/29/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

#import "EmplesAppearanceService.h"
#import <GoogleMaps/GoogleMaps.h>
#define GOOGLE_MAPS_APIKEY @"AIzaSyBq67F_e2PQEWtKgCDDkHBpnVH1r383nQo"

@implementation EmplesAppearanceService

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [[UINavigationBar appearance] setBarTintColor:[UIColor whiteColor]];
    [[UINavigationBar appearance] setTintColor:[UIColor blueColor]];
    [[UINavigationBar appearance] setTitleTextAttributes:
     @{NSForegroundColorAttributeName:[UIColor greenColor],
       NSFontAttributeName:[UIFont boldSystemFontOfSize:15.0]}];
    [[UIBarButtonItem appearanceWhenContainedInInstancesOfClasses:
      @[[UINavigationBar class]]] setTitleTextAttributes:
     @{NSForegroundColorAttributeName:[UIColor greenColor],
       NSFontAttributeName:[UIFont boldSystemFontOfSize:15.0] }forState:UIControlStateNormal];
    [UINavigationBar appearance].translucent = NO;
    [GMSServices provideAPIKey:GOOGLE_MAPS_APIKEY];
    return YES;
}

@end
