//
//  EmplesStackedView.m
//  emplesMVC
//
//  Created by Vasily Popov on 10/28/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

#import "EmplesStackedView.h"
#import "EmplesStackedViewManager.h"
#import "EmplesProgressView.h"
#import "EmplesStackedController.h"
#import "ColorStrings.h"
#import "EmplesStackedViewAnimator.h"
#import <ZLSwipeableView/ZLSwipeableView.h>

@interface EmplesStackedView ()

@property (strong, nonatomic) ZLSwipeableView *swipeableView;
@property (strong, nonatomic) EmplesStackedViewManager *sourceManager;
@property (strong, nonatomic) EmplesProgressView *progressView;


@end

@implementation EmplesStackedView

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = [@"Stack" uppercaseString];
    self.view.backgroundColor = [UIColor colorNamed:emplesGreenColor];
    [self createStackedView];
    self.progressView = [[EmplesProgressView alloc] initWithFrame:CGRectZero];
    [self.navigationController.view addSubview:self.progressView];
    [self setupConstraints];
    [self.controller viewDidLoad];
    // Do any additional setup after loading the view.
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

-(void)setupConstraints
{
    self.progressView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.progressView.leftAnchor constraintEqualToAnchor:self.navigationController.view.leftAnchor constant:0].active = YES;
    [self.progressView.rightAnchor constraintEqualToAnchor:self.navigationController.view.rightAnchor constant:0].active = YES;
    [self.progressView.topAnchor constraintEqualToAnchor:self.navigationController.view.topAnchor constant:0].active = YES;
    [self.progressView.bottomAnchor constraintEqualToAnchor:self.navigationController.view.bottomAnchor constant:0].active = YES;
}

-(void)createStackedView
{
    self.swipeableView = [[ZLSwipeableView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:self.swipeableView];
    [self.swipeableView setAutoresizingMask:UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth];
    self.swipeableView.numberOfActiveViews = 4;
    self.sourceManager = [[EmplesStackedViewManager alloc] init];
    self.swipeableView.dataSource = [self.sourceManager dataSourceForStackedView:self.swipeableView];
    self.swipeableView.delegate = [self.sourceManager delegateForStackedView:self.swipeableView];
    self.swipeableView.viewAnimator = [EmplesStackedViewAnimator new];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)showProgressView
{
    [self.progressView show];
}

-(void)hideProgressView
{
    [self.progressView hide];
}

-(void)showData
{
    [self.sourceManager updateDataSource:self.model.dataSource];
    [self.swipeableView loadViewsIfNeeded];
}

@end
