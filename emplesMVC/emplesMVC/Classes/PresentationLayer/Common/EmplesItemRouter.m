//
//  EmplesItemRouter.m
//  emplesMVC
//
//  Created by Vasily Popov on 10/30/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

#import "EmplesItemRouter.h"
#import "EmplesRecAreaJSONModel.h"
#import "EmplesDetailView.h"
#import "EmplesDetailController.h"
#import "EmplesDetailAreaModel.h"

@implementation EmplesItemRouter

-(void)navigateToItemDetail:(EmplesRecAreaJSONModel*)item
{
    EmplesDetailAreaModel *model = [[EmplesDetailAreaModel alloc] initWithItem:item];
    EmplesDetailController *controller = [[EmplesDetailController alloc] initWithModel:model];
    EmplesDetailView *view = [EmplesDetailView new];
    view.model = model;
    view.controller = controller;
    controller.view = view;
    [self.viewController pushViewController:view animated:YES];
}

@end
