//
//  EmplesGoogleMapService.m
//  emplesMVVM
//
//  Created by Vasily Popov on 11/5/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

#import "EmplesGoogleMapService.h"
#import <GoogleMaps/GoogleMaps.h>
#define GOOGLE_MAPS_APIKEY @"AIzaSyBq67F_e2PQEWtKgCDDkHBpnVH1r383nQo"

@implementation EmplesGoogleMapService

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [GMSServices provideAPIKey:GOOGLE_MAPS_APIKEY];
    return YES;
}

@end
