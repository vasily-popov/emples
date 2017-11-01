//
//  AppDelegate.m
//  emplesMVC
//
//  Created by Vasily Popov on 10/27/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

#import "AppDelegate.h"
#import "EmplesMenuView.h"
#import "EmplesMenuPresenter.h"
#import "EmplesMenuRouter.h"
#import "EmplesNavigationController.h"
#import "EmplesAppearanceService.h"

@implementation AppDelegate

-(instancetype)init
{
    self = [super init];
    if(self)
    {
        self.services = @[[EmplesAppearanceService new]];
    }
    return self;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [super application:application didFinishLaunchingWithOptions:launchOptions];
    
    EmplesMenuModel *model = [EmplesMenuModel new];
    EmplesMenuPresenter *presenter = [[EmplesMenuPresenter alloc] initWithModel:model];
    EmplesMenuView *view = [EmplesMenuView new];
    view.presenter = presenter;
    presenter.view = view;
    EmplesNavigationController *navVC = [[EmplesNavigationController alloc] initWithRootViewController:view];
    EmplesMenuRouter *router = [[EmplesMenuRouter alloc] initWithNavigationVC:navVC andWindow:self.window];
    presenter.router = router;
    
    self.window.rootViewController = navVC;
    [self.window makeKeyAndVisible];
    return YES;
}

@end
