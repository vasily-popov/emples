//
//  EmplesDetailController+Test.m
//  emplesMVCTests
//
//  Created by Vasily Popov on 11/29/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

#import <Specta/Specta.h>
#import <Expecta/Expecta.h>
#import <OCMock/OCMock.h>
#import "EmplesDetailPresenter.h"

@interface EmplesDetailPresenter (Test)
    
@property (nonatomic, strong) EmplesDetailAreaModel *model;
    
@end

SpecBegin(EmplesDetailPresenter)


describe(@"EmplesDetailPresenter", ^{
    
    __block EmplesDetailPresenter *presenter = nil;
    __block id modelMock = nil;
    __block id viewMock = nil;
    beforeEach(^{
        modelMock = OCMClassMock([EmplesDetailAreaModel class]);
        viewMock = OCMClassMock([EmplesDetailView class]);
        
        presenter = [[EmplesDetailPresenter alloc] initWithModel:modelMock];
        presenter.view = viewMock;
        expect(presenter).notTo.beNil();
        expect(presenter.model).notTo.beNil();
        expect(presenter.view).notTo.beNil();
    });
    
    it(@"should not crash", ^{
        expect(^{
            [presenter viewDidLoad];
        }).notTo.raiseAny();
    });
    
    afterEach(^{
        [modelMock stopMocking];
        [viewMock stopMocking];
        modelMock = nil;
        viewMock = nil;
        presenter = nil;
    });
});

SpecEnd

