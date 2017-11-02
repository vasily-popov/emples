//
//  BaseRouter.h
//  emplesMVC
//
//  Created by Vasily Popov on 10/29/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol UIRouterProtocol <NSObject>

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender;
-(void) setRootViewController:(UIViewController*)vc;
-(void) popViewControllerAnimated:(BOOL)animated;
-(void) popToRootViewControllerAnimated:(BOOL)animated;
-(void) dismissViewControllerAnimated:(BOOL) animated completion:(void (^)(void))completion;
-(void) showAlertWithTitle:(NSString*)title message:(NSString*)message;

@end

@interface BaseRouter : NSObject <UIRouterProtocol>

@property (weak, nonatomic) UINavigationController *viewController;
@property (weak, nonatomic) UIWindow *window;

-(instancetype)initWithNavigationVC:(UINavigationController*)viewController andWindow:(UIWindow*)window;

@end
