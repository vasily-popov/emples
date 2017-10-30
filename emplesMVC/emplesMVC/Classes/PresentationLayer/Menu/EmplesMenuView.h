//
//  EmplesMenuView.h
//  emplesMVC
//
//  Created by Vasily Popov on 10/28/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EmplesMenuModelDecorator.h"

@class EmplesMenuController;
@interface EmplesMenuView : UIViewController

@property (nonatomic, strong) EmplesMenuController *controller;
@property (nonatomic, strong) EmplesMenuModelDecorator *model;

@end
