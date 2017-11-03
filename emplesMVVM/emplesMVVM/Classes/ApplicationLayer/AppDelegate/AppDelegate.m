//
//  AppDelegate.m
//  emplesMVC
//
//  Created by Vasily Popov on 10/27/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

#import "AppDelegate.h"
#import "EmplesMenuAssembly.h"
#import "EmplesCollectionsAssembly.h"
#import "DataLayerAssembly.h"

@interface AppDelegate()

@end

@implementation AppDelegate

/**
 
 ** uncomment function below if you want to use Typhoon AppDelegate integration
 ** don't forget to remove TyphoonInitialAssemblies keys from plist
 
- (NSArray *)initialAssemblies
{
    return @[[ApplicationAssembly class],
             [EmplesMenuAssembly class],
             [EmplesCollectionsAssembly class],
             [DataLayerAssembly class]
             ];
}
 */

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [super application:application didFinishLaunchingWithOptions:launchOptions];
    [self.window makeKeyAndVisible];
    return YES;
}

@end
