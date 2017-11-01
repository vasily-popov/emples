//
//  BaseRouter.m
//  emplesMVC
//
//  Created by Vasily Popov on 10/29/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

#import "BaseRouter.h"

@implementation BaseRouter

-(instancetype)initWithNavigationVC:(UINavigationController*)viewController
                          andWindow:(UIWindow*)window
{
    self = [super init];
    if (self) {
        self.window = window;
        self.viewController = viewController;
    }
    return self;
}

-(void)dealloc
{
    
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
}
-(void)setRootViewController:(UIViewController*)vc
{
    self.window.rootViewController = vc;
}

-(void) popViewControllerAnimated:(BOOL)animated
{
    [self.viewController popViewControllerAnimated:animated];
}

-(void)popToRootViewControllerAnimated:(BOOL)animated
{
    [self.viewController popToRootViewControllerAnimated:animated];
}

-(void)dismissViewControllerAnimated:(BOOL) animated completion:(void (^ _Nullable)(void))completion
{
    [self.viewController dismissViewControllerAnimated:YES completion:completion];
}

-(void) showAlertWithTitle:(NSString*)title message:(NSString*)message
{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    alert.modalPresentationStyle = UIModalPresentationOverCurrentContext;
    alert.providesPresentationContextTransitionStyle = YES;
    alert.definesPresentationContext = YES;
    alert.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self.viewController presentViewController:alert animated:YES completion:nil];
}

@end
