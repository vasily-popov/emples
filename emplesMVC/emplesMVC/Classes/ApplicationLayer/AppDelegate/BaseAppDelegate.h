//
//  BaseAppDelegate.h
//  Onesti
//
//  Created by Vasily Popov on 10/9/17.
//  Copyright © 2017 home.smart. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ApplicationService <UIApplicationDelegate>

@end

@interface BaseAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) NSArray *services;


@end
