//
//  main.m
//  emplesMVP
//
//  Created by Vasily Popov on 11/1/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

int main(int argc, char * argv[]) {
    @autoreleasepool {
        Class appDelegateClass = NSClassFromString(@"TestingAppDelegate");
        
        if (!appDelegateClass) {
            appDelegateClass = [AppDelegate class];
        }
        
        return UIApplicationMain(argc, argv, nil, NSStringFromClass(appDelegateClass));
        
    }
}
