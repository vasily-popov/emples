//
//  EmplesDetailView+Test.m
//  emplesMVCTests
//
//  Created by Vasily Popov on 11/29/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

#import <Specta/Specta.h>
#import <Expecta/Expecta.h>
#import <OCMock/OCMock.h>
#import "EmplesDetailView.h"
#import "EmplesDetailTableViewManager.h"
#import "EmplesDetailPresenter.h"


@interface EmplesDetailView(Test)
    
@property (strong, nonatomic, readonly) UITableView *table;
@property (strong, nonatomic, readonly) EmplesDetailTableViewManager *sourceManager;
    
@end


SpecBegin(EmplesDetailView)

describe(@"EmplesDetailView", ^{
    
    __block EmplesDetailView *view = nil;
    __block id mock = nil;
    beforeEach(^{
        mock = OCMClassMock([EmplesDetailPresenter class]);
        view = [EmplesDetailView new];
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
    
    it(@"should reload collection", ^{
        expect(^{
            [view viewDidLoad];
            [view setSourceArray:@[@1,@3]];
        }).notTo.raiseAny();
        OCMVerify([view.table reloadData]);
    });
    
    it(@"should set title", ^{
        expect(^{
            [view setViewTitle:@"test"];
        }).notTo.raiseAny();
        expect(view.title).to.equal(@"test");
    });

    it(@"should not crash", ^{
        expect(^{
            [view viewDidLoad];
            [view didReceiveMemoryWarning];
            [view setSourceArray:nil];
        }).notTo.raiseAny();
    });
    
    afterEach(^{
        mock = nil;
        view = nil;
    });
});

SpecEnd

