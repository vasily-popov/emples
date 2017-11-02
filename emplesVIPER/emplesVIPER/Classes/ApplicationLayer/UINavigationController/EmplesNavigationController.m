//
//  EmplesNavigationController.m
//  emplesMVC
//
//  Created by Vasily Popov on 10/29/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

#import "EmplesNavigationController.h"

@interface EmplesNavigationController ()

@end

static NSString *const kBackButton = @"back-arrow";

@implementation EmplesNavigationController

- (instancetype)initWithRootViewController:(UIViewController *)rootViewController
{
    self = [super initWithRootViewController:rootViewController];
    if (self) {
        self.delegate = self;
    }
    
    return self;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        self.delegate = self;
    }
    
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.delegate = self;
    }
    
    return self;
}

- (BOOL)shouldAutorotate {
    return YES;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return [self.visibleViewController supportedInterfaceOrientations];
}

- (void)navigationController:(UINavigationController *)navigationController
      willShowViewController:(UIViewController *)viewController
                    animated:(BOOL)animated
{
    if (self.viewControllers.count > 1)
    {
        UIImage *backButton = [UIImage imageNamed:kBackButton];
        UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithImage:backButton
                                                                     style:UIBarButtonItemStylePlain
                                                                    target:self
                                                                action:@selector(backButtonClicked:)];
        viewController.navigationItem.leftBarButtonItem = backItem;
        
        self.interactivePopGestureRecognizer.delegate = (id<UIGestureRecognizerDelegate>)viewController;
    }
}

- (void)backButtonClicked:(id)sender
{
    [self popViewControllerAnimated:YES];
}

@end
