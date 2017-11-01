//
//  EmplesDetailView.h
//  emplesMVC
//
//  Created by Vasily Popov on 10/28/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EmplesDetailAreaModel.h"

@class EmplesDetailController;

@interface EmplesDetailView : UIViewController

@property (nonatomic, strong) EmplesDetailController *controller;
@property (nonatomic, strong) EmplesDetailAreaModel *model;

@end
