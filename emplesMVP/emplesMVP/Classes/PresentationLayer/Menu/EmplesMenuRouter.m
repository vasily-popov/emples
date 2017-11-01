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
#import "EmplesListPresenter.h"
#import "EmplesListView.h"


//grid
#import "EmplesGridView.h"
#import "EmplesGridPresenter.h"

//carousel

#import "EmplesCarouselView.h"
#import "EmplesCarouselPresenter.h"

//gallery

#import "EmplesGalleryView.h"
#import "EmplesGalleryPresenter.h"

//stack

#import "EmplesStackedView.h"
#import "EmplesStackedPresenter.h"

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
            EmplesListPresenter *presenter = [[EmplesListPresenter alloc] initWithModel:model];
            EmplesListView *view = [EmplesListView new];
            view.presenter = presenter;
            presenter.view = view;
            presenter.router = router;
            [self.viewController pushViewController:view animated:YES];
            break;
        }
        case EnumMenuSelectedItemGrid:
        {
            EmplesGridPresenter *presenter = [[EmplesGridPresenter alloc] initWithModel:model];
            EmplesGridView *view = [EmplesGridView new];
            view.presenter = presenter;
            presenter.view = view;
            presenter.router = router;
            [self.viewController pushViewController:view animated:YES];
            break;
        }
        case EnumMenuSelectedItemStack:
        {
            EmplesStackedPresenter *presenter = [[EmplesStackedPresenter alloc] initWithModel:model];
            EmplesStackedView *view = [EmplesStackedView new];
            view.presenter = presenter;
            presenter.view = view;
            presenter.router = router;
            [self.viewController pushViewController:view animated:YES];
            break;
        }
        case EnumMenuSelectedItemGallery:
        {
            EmplesGalleryPresenter *presenter = [[EmplesGalleryPresenter alloc] initWithModel:model];
            EmplesGalleryView *view = [EmplesGalleryView new];
            view.presenter = presenter;
            presenter.view = view;
            presenter.router = router;
            [self.viewController pushViewController:view animated:YES];
            break;
        }
        case EnumMenuSelectedItemCarusel:
        {
            EmplesCarouselPresenter *presenter = [[EmplesCarouselPresenter alloc] initWithModel:model];
            EmplesCarouselView *view = [EmplesCarouselView new];
            view.presenter = presenter;
            presenter.view = view;
            presenter.router = router;
            
            [self.viewController pushViewController:view animated:YES];
            break;
        }
    }
}

@end
