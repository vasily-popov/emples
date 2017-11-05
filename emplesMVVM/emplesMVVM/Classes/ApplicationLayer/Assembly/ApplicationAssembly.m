//
//  AppDelegateAssembly.m
//  emplesMVP
//
//  Created by Vasily Popov on 11/1/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

#import "ApplicationAssembly.h"
#import "AppDelegate.h"
#import "EmplesNavigationController.h"
#import "EmplesMenuAssembly.h"
#import "EmplesAppearanceService.h"
#import "EmplesGoogleMapService.h"

@implementation ApplicationAssembly

- (AppDelegate *)appDelegate
{
    return [TyphoonDefinition withClass:[AppDelegate class] configuration:^(TyphoonDefinition *definition)
            {
                [definition injectProperty:@selector(window) with:[self window]];
                [definition injectProperty:@selector(services)
                                      with:@[
                                             [EmplesAppearanceService new],
                                             [EmplesGoogleMapService new]
                                             ]];
            }];
}

- (UIWindow *)window
{
    return [TyphoonDefinition withClass:[UIWindow class] configuration:^(TyphoonDefinition *definition)
            {
                [definition useInitializer:@selector(initWithFrame:) parameters:^(TyphoonMethod *initializer)
                 {
                     [initializer injectParameterWith:[NSValue valueWithCGRect:[[UIScreen mainScreen] bounds]]];
                 }];
                [definition injectProperty:@selector(rootViewController) with:[self rootViewController]];
                definition.scope = TyphoonScopeSingleton;
            }];
}

- (UIViewController *)rootViewController
{
    return [TyphoonDefinition withClass:[EmplesNavigationController class] configuration:^(TyphoonDefinition *definition)
            {
                [definition useInitializer:@selector(initWithRootViewController:) parameters:^(TyphoonMethod *initializer)
                 {
                     [initializer injectParameterWith:[self.menuComponent menuView]];
                 }];
                definition.scope = TyphoonScopeSingleton;
            }];
}

@end
