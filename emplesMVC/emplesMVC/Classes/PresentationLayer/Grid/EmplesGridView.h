//
//  EmplesGridView.h
//  emplesMVC
//
//  Created by Vasily Popov on 10/28/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EmplesGridModelDecorator.h"

@class EmplesGridController;

@interface EmplesGridView : UIViewController

@property (nonatomic, strong) EmplesGridController *controller;
@property (nonatomic, strong) EmplesGridModelDecorator *model;

-(void)showProgressView;
-(void)hideProgressView;
-(void)showData;

@end
