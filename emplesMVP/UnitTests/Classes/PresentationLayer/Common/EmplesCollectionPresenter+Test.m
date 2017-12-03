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
#import "EmplesAreasModel.h"


SpecBegin(EmplesCollectionPresenter)


describe(@"EmplesCollectionPresenter", ^{
    
    __block id modelMock = OCMClassMock([EmplesAreasModel class]);
    __block id routerMock = OCMClassMock([EmplesItemRouter class]);
    __block id viewMock = OCMProtocolMock(@protocol(EmplesCollectionViewProtocol));
    __block EmplesCollectionPresenter * presenter = nil;
    beforeAll(^{
        presenter = [[EmplesCollectionPresenter alloc] initWithModel:modelMock];
        presenter.view = viewMock;
        presenter.router = routerMock;
    });
    
    it(@"should be exist", ^{
        expect(presenter).notTo.beNil();
        expect(presenter.view).notTo.beNil();
        expect(presenter.router).notTo.beNil();
    });
    
    it(@"should handle view did load", ^{
        expect(^{
            [presenter viewDidLoad];
        }).notTo.raiseAny();
        
        OCMVerify([viewMock showProgressView]);
        OCMVerify([modelMock fetchAreas]);
    });
    
    it(@"should prepared collection array be nil", ^{
        expect([presenter prepareCollectionArray]).to.beNil();
    });
    
    afterAll(^{
        [modelMock stopMocking];
        [routerMock stopMocking];
        [viewMock stopMocking];
        modelMock = nil;
        routerMock = nil;
        viewMock = nil;
        presenter = nil;
    });
});

SpecEnd
