//
//  EmplesMenuView+Test.m
//  emplesMVCTests
//
//  Created by Vasily Popov on 11/29/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

#import <Specta/Specta.h>
#import <Expecta/Expecta.h>
#import <OCMock/OCMock.h>
#import "EmplesMenuView.h"
#import "EmplesDetailTableViewManager.h"
#import "EmplesMenuPresenter.h"


@interface EmplesMenuView(Test)
    
@property (strong, nonatomic, readonly) UITableView *table;
@property (strong, nonatomic, readonly) EmplesDetailTableViewManager *sourceManager;
    
@end

SpecBegin(EmplesMenuView)


describe(@"EmplesMenuView", ^{
    
    __block EmplesMenuView *view = nil;
    __block id mock = nil;
    beforeEach(^{
        mock = OCMClassMock([EmplesMenuPresenter class]);
        view = [EmplesMenuView new];
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
            [view setTableDataSource:@[@1,@3]];
        }).notTo.raiseAny();
        OCMVerify([view.table reloadData]);
    });
    
    it(@"should not crash", ^{
        expect(^{
            [view viewDidLoad];
            [view didReceiveMemoryWarning];
            [view setTableDataSource:nil];
        }).notTo.raiseAny();
    });
    
    afterEach(^{
        mock = nil;
        view = nil;
    });
});

SpecEnd
