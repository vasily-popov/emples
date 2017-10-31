//
//  EmplesStackedView.h
//  emplesMVC
//
//  Created by Vasily Popov on 10/28/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EmplesListModelDecorator.h"

@class EmplesStackedController;
@interface EmplesStackedView : UIViewController

@property (nonatomic, strong) EmplesStackedController *controller;
@property (nonatomic, strong) EmplesListModelDecorator *model;

-(void)showProgressView;
-(void)hideProgressView;
-(void)showData;

@end
