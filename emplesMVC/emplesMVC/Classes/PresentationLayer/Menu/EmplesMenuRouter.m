//
//  EmplesMenuRouter.m
//  emplesMVC
//
//  Created by Vasily Popov on 10/29/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

#import "EmplesMenuRouter.h"

#import "EmplesAreasModel.h"
#import "EmplesFSJsonReader.h"
#import "EmplesItemRouter.h"

//list
#import "EmplesListModelDecorator.h"
#import "EmplesListController.h"
#import "EmplesListView.h"


//grid
#import "EmplesGridModelDecorator.h"
#import "EmplesGridController.h"
#import "EmplesGridView.h"

//carousel

#import "EmplesCarouselView.h"
#import "EmplesCarouselController.h"

//gallery

#import "EmplesGalleryView.h"
#import "EmplesGalleryController.h"

@implementation EmplesMenuRouter

-(void)navigateToSelectedItem:(EnumMenuSelectedItem)item
{
    DataAreaRequestClient *client = [[DataAreaRequestClient alloc] initWithFactory:[EmplesFSJsonReader new]];
    EmplesAreasModel *model = [[EmplesAreasModel alloc] initWithClient:client];
     EmplesItemRouter *router = [[EmplesItemRouter alloc] initWithNavigationVC:self.viewController andWindow:self.window];
    switch (item)
    {
        case EnumMenuSelectedItemList:
        {
            EmplesListModelDecorator *decorator = [[EmplesListModelDecorator alloc] initWithModel:model];
            EmplesListController *controller = [[EmplesListController alloc] initWithModel:model];
            EmplesListView *view = [EmplesListView new];
            view.model = decorator;
            view.controller = controller;
            controller.view = view;
            controller.router = router;
            [self.viewController pushViewController:view animated:YES];
            break;
        }
        case EnumMenuSelectedItemGrid:
        {
            EmplesGridModelDecorator *decorator = [[EmplesGridModelDecorator alloc] initWithModel:model];
            EmplesGridController *controller = [[EmplesGridController alloc] initWithModel:model];
            EmplesGridView *view = [EmplesGridView new];
            view.model = decorator;
            view.controller = controller;
            controller.view = view;
            controller.router = router;
            [self.viewController pushViewController:view animated:YES];
            break;
        }
        case EnumMenuSelectedItemStack:
        {
            
        }
        case EnumMenuSelectedItemGallery:
        {
            EmplesGridModelDecorator *decorator = [[EmplesGridModelDecorator alloc] initWithModel:model];
            EmplesGalleryController *controller = [[EmplesGalleryController alloc] initWithModel:model];
            EmplesGalleryView *view = [EmplesGalleryView new];
            view.model = decorator;
            view.controller = controller;
            controller.view = view;
            controller.router = router;
            [self.viewController pushViewController:view animated:YES];
            break;
        }
        case EnumMenuSelectedItemCarusel:
        {
            EmplesListModelDecorator *decorator = [[EmplesListModelDecorator alloc] initWithModel:model];
            EmplesCarouselController *controller = [[EmplesCarouselController alloc] initWithModel:model];
            EmplesCarouselView *view = [EmplesCarouselView new];
            view.model = decorator;
            view.controller = controller;
            controller.view = view;
            controller.router = router;
            [self.viewController pushViewController:view animated:YES];
            break;
        }
    }
}

@end
