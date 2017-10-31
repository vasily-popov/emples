//
//  EmplesAppearanceService.m
//  emplesMVC
//
//  Created by Vasily Popov on 10/29/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

#import "EmplesAppearanceService.h"

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
    
    return YES;
}

@end
