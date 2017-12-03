//
//  EmplesStackedView+Test.m
//  emplesMVCTests
//
//  Created by Vasily Popov on 11/29/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//


#import <Specta/Specta.h>
#import <Expecta/Expecta.h>
#import <OCMock/OCMock.h>
#import "EmplesStackedView.h"
#import "EmplesStackedViewManager.h"
#import "DataSourceItem.h"
#import "EmplesCollectionPresenter.h"
#import <ZLSwipeableView/ZLSwipeableView.h>

@interface EmplesStackedView(Test)
    
@property (strong, nonatomic, readonly) ZLSwipeableView *swipeableView;
@property (strong, nonatomic, readonly) EmplesStackedViewManager *sourceManager;
    
@end

SpecBegin(EmplesStackedView)


describe(@"EmplesStackedView", ^{
    
    __block EmplesStackedView *view = nil;
    __block id mock = nil;
    beforeEach(^{
        mock = OCMClassMock([EmplesCollectionPresenter class]);
        view = [EmplesStackedView new];
        expect(view).notTo.beNil();
        view.presenter = mock;
        UINavigationController *vc = [[UINavigationController alloc] initWithRootViewController:view];
        expect(vc).notTo.beNil();
    });
    
    it(@"should call viewDidload", ^{
        expect(^{
            [view viewDidLoad];
        }).notTo.raiseAny();
        expect(view.swipeableView).toNot.beNil();
        expect(view.sourceManager).toNot.beNil();
        expect(view.swipeableView.viewAnimator).toNot.beNil();
        OCMVerify([mock viewDidLoad]);
    });
    
    it(@"should reload stack", ^{
        expect(^{
            [view viewDidLoad];
            [view showProgressView];
            id mockSource = OCMClassMock([DataSourceItem class]);
            [view updateCollectionItems:@[mockSource]];
            [view hideProgressView];
        }).notTo.raiseAny();
        OCMVerify([view.swipeableView loadViewsIfNeeded]);
    });
    
    it(@"should not crash", ^{
        expect(^{
            [view viewDidLoad];
            [view didReceiveMemoryWarning];
            [view showProgressView];
            [view updateCollectionItems:nil];
            [view hideProgressView];
        }).notTo.raiseAny();
    });
    
    afterEach(^{
        [mock stopMocking];
        mock = nil;
        view = nil;
    });
});

SpecEnd
