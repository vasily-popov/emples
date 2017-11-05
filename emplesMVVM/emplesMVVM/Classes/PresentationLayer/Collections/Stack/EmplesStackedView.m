//
//  EmplesStackedView.m
//  emplesMVC
//
//  Created by Vasily Popov on 10/28/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

#import "EmplesStackedView.h"
#import "ColorStrings.h"
#import "EmplesStackedViewAnimator.h"
#import <ZLSwipeableView/ZLSwipeableView.h>

@interface EmplesStackedView ()

@property (strong, nonatomic) ZLSwipeableView *swipeableView;


@end

@implementation EmplesStackedView

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorNamed:emplesGreenColor];
    [self bindViewModel];
    [self.viewModel viewDidLoad];
}

-(void)bindViewModel
{
    RAC(self, title) = RACObserve(self, viewModel.title);
    RAC(self.swipeableView, dataSource) = RACObserve(self, viewModel.dataSource);
    
    @weakify(self);
    [[[RACObserve(self.viewModel.dataSource, source) ignore:nil] distinctUntilChanged]
     subscribeNext:^(id _)
     {
         @strongify(self);
         [self.swipeableView loadViewsIfNeeded];
     }];
    
    [[[self.viewModel.loadItemsAction.executing skipWhileBlock:^BOOL(NSNumber *loading) {
        return !loading.boolValue;
    }] distinctUntilChanged] subscribeNext:^(NSNumber *loading) {
        @strongify(self);
        if (loading.boolValue)
        {
            [self showProgressView];
        }
        else
        {
            [self hideProgressView];
        }
    }];
}

-(void)dealloc
{
    
}

- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id <UIViewControllerTransitionCoordinator>)coordinator
{
    [super viewWillTransitionToSize:size withTransitionCoordinator:coordinator];
    [self.swipeableView discardAllViews];
    [coordinator animateAlongsideTransition:^(id<UIViewControllerTransitionCoordinatorContext> context)
    {
        [self.swipeableView loadViewsIfNeeded];
    } completion:^(id<UIViewControllerTransitionCoordinatorContext> context) {
    }];
}

-(ZLSwipeableView*)swipeableView
{
    if(!_swipeableView)
    {
        _swipeableView = [[ZLSwipeableView alloc] initWithFrame:self.view.bounds];
        [self.view addSubview:_swipeableView];
        [_swipeableView setAutoresizingMask:UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth];
        _swipeableView.numberOfActiveViews = 4;
        _swipeableView.viewAnimator = [EmplesStackedViewAnimator new];
    }
    return _swipeableView;
}

@end
