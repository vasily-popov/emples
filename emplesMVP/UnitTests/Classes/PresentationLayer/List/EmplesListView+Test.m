//
//  EmplesListView+Test.m
//  emplesMVCTests
//
//  Created by Vasily Popov on 11/29/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//


#import <Specta/Specta.h>
#import <Expecta/Expecta.h>
#import <OCMock/OCMock.h>
#import "EmplesListView.h"
#import "EmplesListTableViewManager.h"
#import "EmplesListModelDecorator.h"
#import "EmplesCollectionPresenter.h"

@interface EmplesListView(Test)
    
@property (strong, nonatomic, readonly) UITableView *table;
@property (strong, nonatomic, readonly) EmplesListTableViewManager *sourceManager;
    
@end

SpecBegin(EmplesListView)


describe(@"EmplesListView", ^{
    
    __block EmplesListView *view = nil;
    __block id mock = nil;
    beforeEach(^{
        mock = OCMClassMock([EmplesCollectionPresenter class]);
        view = [EmplesListView new];
        expect(view).notTo.beNil();
        view.presenter = mock;
        UINavigationController *vc = [[UINavigationController alloc] initWithRootViewController:view];
        expect(vc).notTo.beNil();
    });
    
    it(@"should call viewDidload", ^{
        expect(^{
            [view viewDidLoad];
        }).notTo.raiseAny();
        expect(view.table).toNot.beNil();
        expect(view.sourceManager).toNot.beNil();
        OCMVerify([mock viewDidLoad]);
    });
    
    it(@"should reload table", ^{
        expect(^{
            [view viewDidLoad];
            [view showProgressView];
            [view updateCollectionItems:@[@1,@3]];
            [view hideProgressView];
        }).notTo.raiseAny();
        OCMVerify([view.table reloadData]);
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

