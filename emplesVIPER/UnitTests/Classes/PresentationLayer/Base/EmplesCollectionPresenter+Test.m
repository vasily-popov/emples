//
//  EmplesCollectionController+Test.m
//  emplesMVCTests
//
//  Created by Vasily Popov on 11/29/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

#import <Specta/Specta.h>
#import <Expecta/Expecta.h>
#import <OCMock/OCMock.h>
#import "EmplesCollectionPresenter.h"

SpecBegin(EmplesCollectionPresenter)


describe(@"EmplesCollectionPresenter", ^{
    
    __block id useCaseMock = OCMProtocolMock(@protocol(DisplayAreaCollectionUseCase));
    __block id routerMock = OCMClassMock([EmplesItemRouter class]);
    __block id viewMock = OCMProtocolMock(@protocol(EmplesCollectionViewProtocol));
    __block EmplesCollectionPresenter * presenter = nil;
    beforeAll(^{
        presenter = [[EmplesCollectionPresenter alloc] init];
        presenter.view = viewMock;
        presenter.router = routerMock;
        presenter.displayCollectionUseCase = useCaseMock;
    });
    
    it(@"should be exist", ^{
        expect(presenter).notTo.beNil();
        expect(presenter.view).notTo.beNil();
        expect(presenter.router).notTo.beNil();
        expect(presenter.displayCollectionUseCase).notTo.beNil();
    });
    
    it(@"should handle view did load", ^{
        expect(^{
            [presenter viewDidLoad];
        }).notTo.raiseAny();
        
        OCMVerify([viewMock showProgressView]);
        OCMVerify([useCaseMock displayAreaCollection:[OCMArg any]]);
    });
    
    it(@"should prepared collection array be nil", ^{
        expect([presenter prepareCollectionArrayFromArray:@[@1]]).to.haveCount(1);
    });
    
    it(@"should naviagte item", ^{
        expect(^{
            [presenter selectedItem:nil];
        }).notTo.raiseAny();
        OCMVerify([routerMock navigateToItemDetail:nil]);
    });
    
    afterAll(^{
        [useCaseMock stopMocking];
        [routerMock stopMocking];
        [viewMock stopMocking];
        useCaseMock = nil;
        routerMock = nil;
        viewMock = nil;
        presenter = nil;
    });
});

SpecEnd
