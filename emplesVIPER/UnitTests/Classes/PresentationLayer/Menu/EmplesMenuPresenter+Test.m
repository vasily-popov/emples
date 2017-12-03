//
//  EmplesMenuController+Test.m
//  emplesMVCTests
//
//  Created by Vasily Popov on 11/29/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

#import <Specta/Specta.h>
#import <Expecta/Expecta.h>
#import <OCMock/OCMock.h>
#import "EmplesMenuPresenter.h"

@interface EmplesMenuPresenter (Test)

@property (nonatomic, strong, readonly) EmplesMenuModel *model;
-(void)selectedItem:(EnumMenuSelectedItem)item;

@end

SpecBegin(EmplesMenuPresenter)


describe(@"EmplesMenuPresenter", ^{
    
    __block EmplesMenuPresenter *presenter = nil;
    __block id mock = nil;
    __block id mockRouter = nil;
    __block id mockView = nil;
    beforeEach(^{
        mock = OCMClassMock([EmplesMenuModel class]);
        mockRouter = OCMClassMock([EmplesMenuRouter class]);
        mockView = OCMClassMock([EmplesMenuView class]);
        presenter = [[EmplesMenuPresenter alloc] initWithModel:mock];
        presenter.router = mockRouter;
        presenter.view = mockView;
        expect(presenter).notTo.beNil();
        expect(presenter.model).notTo.beNil();
    });
    
    it(@"should not crash", ^{
        expect(^{
            [presenter viewDidLoad];
        }).notTo.raiseAny();
        OCMVerify([mockView setTableDataSource:[OCMArg any]]);
    });
    
    it(@"should naviagte item", ^{
        expect(^{
            [presenter selectedItem:EnumMenuSelectedItemList];
        }).notTo.raiseAny();
        OCMVerify([mockRouter navigateToSelectedItem:EnumMenuSelectedItemList]);
    });
    
    afterEach(^{
        [mock stopMocking];
        [mockView stopMocking];
        [mockRouter stopMocking];
        mock = nil;
        mockView = nil;
        mockRouter = nil;
        presenter = nil;
    });
});

SpecEnd

