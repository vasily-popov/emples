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
#import "EmplesGridView.h"

//carousel

#import "EmplesCarouselView.h"
#import "EmplesCarouselController.h"

//gallery

#import "EmplesGalleryView.h"
#import "EmplesGalleryController.h"

//stack

#import "EmplesStackedView.h"
#import "EmplesStackedController.h"

#import "EmplesCollectionController.h"

@implementation EmplesMenuRouter

-(void)navigateToSelectedItem:(EnumMenuSelectedItem)item
{
    DataAreaRequestClient *client = [[DataAreaRequestClient alloc] initWithFactory:[EmplesFSJsonReader new]];
    EmplesAreasModel *model = [[EmplesAreasModel alloc] initWithClient:client];
    EmplesItemRouter *router = [[EmplesItemRouter alloc] initWithNavigationVC:self.viewController andWindow:self.window];
    EmplesCollectionController *controller = [[EmplesCollectionController alloc] initWithModel:model];
    controller.router = router;
    switch (item)
    {
        case EnumMenuSelectedItemList:
        {
            EmplesListModelDecorator *decorator = [[EmplesListModelDecorator alloc] initWithModel:model];
            EmplesListView *view = [EmplesListView new];
            view.model = decorator;
            view.controller = controller;
            controller.view = view;
            [self.viewController pushViewController:view animated:YES];
            break;
        }
        case EnumMenuSelectedItemGrid:
        {
            EmplesGridModelDecorator *decorator = [[EmplesGridModelDecorator alloc] initWithModel:model];
            EmplesGridView *view = [EmplesGridView new];
            view.model = decorator;
            view.controller = controller;
            controller.view = view;
            [self.viewController pushViewController:view animated:YES];
            break;
        }
        case EnumMenuSelectedItemStack:
        {
            EmplesListModelDecorator *decorator = [[EmplesListModelDecorator alloc] initWithModel:model];
            EmplesStackedView *view = [EmplesStackedView new];
            view.model = decorator;
            view.controller = controller;
            controller.view = view;
            [self.viewController pushViewController:view animated:YES];
            break;
        }
        case EnumMenuSelectedItemGallery:
        {
            EmplesGridModelDecorator *decorator = [[EmplesGridModelDecorator alloc] initWithModel:model];
            EmplesGalleryView *view = [EmplesGalleryView new];
            view.model = decorator;
            view.controller = controller;
            controller.view = view;
            [self.viewController pushViewController:view animated:YES];
            break;
        }
        case EnumMenuSelectedItemCarousel:
        {
            EmplesListModelDecorator *decorator = [[EmplesListModelDecorator alloc] initWithModel:model];
            EmplesCarouselView *view = [EmplesCarouselView new];
            view.model = decorator;
            view.controller = controller;
            controller.view = view;
            [self.viewController pushViewController:view animated:YES];
            break;
        }
    }
}

@end
