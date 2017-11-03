//
//  AppDelegateAssembly.h
//  emplesMVP
//
//  Created by Vasily Popov on 11/1/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

#import <Typhoon/Typhoon.h>
@class AppDelegate;
@class UIViewController;
@class DataLayerAssembly;
@class EmplesMenuAssembly;

@interface ApplicationAssembly : TyphoonAssembly

@property(nonatomic, strong, readonly) DataLayerAssembly *dataComponent;
@property(nonatomic, strong, readonly) EmplesMenuAssembly *menuComponent;

- (AppDelegate *)appDelegate;
- (UIViewController *)rootViewController;
- (UIWindow *)window;

@end
