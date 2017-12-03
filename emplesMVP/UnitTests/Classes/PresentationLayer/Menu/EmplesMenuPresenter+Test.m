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
#import "EmplesAreasModel.h"
#import "EmplesMenuPresenter.h"

@interface EmplesMenuPresenter (Test)
    
@property (nonatomic, strong, readonly) EmplesAreasModel *model;
    
-(void)selectedItem:(EnumMenuSelectedItem)item;
-(void)viewDidLoad;
    
@end

SpecBegin(EmplesMenuPresenter)


describe(@"EmplesMenuPresenter", ^{
    
    __block EmplesMenuPresenter *presenter = nil;
    __block id mock = nil;
    beforeEach(^{
        mock = OCMClassMock([EmplesAreasModel class]);
        presenter = [[EmplesMenuPresenter alloc] initWithModel:mock];
        expect(presenter).notTo.beNil();
        expect(presenter.model).notTo.beNil();
    });
    
    it(@"should not crash", ^{
        expect(^{
            [presenter viewDidLoad];
        }).notTo.raiseAny();
    });
    
    it(@"should naviagte item", ^{
        id mockRouter = OCMClassMock([EmplesMenuRouter class]);
        presenter.router = mockRouter;
        expect(^{
            [presenter selectedItem:EnumMenuSelectedItemList];
        }).notTo.raiseAny();
        OCMVerify([mockRouter navigateToSelectedItem:EnumMenuSelectedItemList]);
    });
    
    afterEach(^{
        [mock stopMocking];
        mock = nil;
        presenter = nil;
    });
});

SpecEnd

