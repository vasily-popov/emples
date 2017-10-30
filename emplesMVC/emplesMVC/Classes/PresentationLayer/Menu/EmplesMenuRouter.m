//
//  EmplesMenuRouter.m
//  emplesMVC
//
//  Created by Vasily Popov on 10/29/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

#import "EmplesMenuRouter.h"
#import "EmplesAreasModel.h"
#import "EmplesListModelDecorator.h"
#import "EmplesListController.h"
#import "EmplesListView.h"
#import "EmplesFSJsonReader.h"
#import "EmplesItemRouter.h"

@implementation EmplesMenuRouter

-(void)navigateToSelectedItem:(EnumMenuSelectedItem)item
{
    switch (item)
    {
        case EnumMenuSelectedItemList:
        {
            DataAreaRequestClient *client = [[DataAreaRequestClient alloc] initWithFactory:[EmplesFSJsonReader new]];
            EmplesAreasModel *model = [[EmplesAreasModel alloc] initWithClient:client];
            EmplesListModelDecorator *decorator = [[EmplesListModelDecorator alloc] initWithModel:model];
            EmplesListController *controller = [[EmplesListController alloc] initWithModel:model];
            EmplesListView *view = [EmplesListView new];
            view.model = decorator;
            view.controller = controller;
            controller.view = view;

            EmplesItemRouter *router = [[EmplesItemRouter alloc] initWithNavigationVC:self.viewController andWindow:self.window];
            controller.router = router;
            [self.viewController pushViewController:view animated:YES];
        }
        case EnumMenuSelectedItemGrid:
        {
            
        }
        case EnumMenuSelectedItemStack:
        {
            
        }
        case EnumMenuSelectedItemGallery:
        {
            
        }
        case EnumMenuSelectedItemCarusel:
        {
            
        }
    }
}

@end
