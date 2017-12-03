//
//  EmplesListModelDecorator+Test.m
//  emplesMVCTests
//
//  Created by Vasily Popov on 11/29/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

#import <Specta/Specta.h>
#import <Expecta/Expecta.h>
#import <OCMock/OCMock.h>
#import "EmplesListModelDecorator.h"
#import "EmplesRecAreaJSONModel.h"

@interface EmplesListModelDecorator(Test)
    
@property (nonatomic, strong, readonly) EmplesAreasModel* model;
    
@end

SpecBegin(EmplesListModelDecorator)

describe(@"EmplesListModelDecorator", ^{
    
    __block EmplesListModelDecorator *decorator = nil;
    __block id mockArea = nil;
    __block id modelMock = nil;
    beforeAll(^{
        modelMock = OCMClassMock([EmplesAreasModel class]);
        mockArea = OCMClassMock([EmplesRecAreaJSONModel class]);
        OCMStub([modelMock dataSource]).andReturn(@[mockArea]);
        decorator = [[EmplesListModelDecorator alloc] initWithModel:modelMock];
    });
    
    it(@"should be exist", ^{
        expect(decorator).notTo.beNil();
        expect(decorator.model).notTo.beNil();
        expect(decorator.dataSource).notTo.beNil();
        expect(decorator.dataSource).to.haveCount(1);
    });
    
    afterAll(^{
        [mockArea stopMocking];
        mockArea = nil;
        [modelMock stopMocking];
        modelMock = nil;
        decorator = nil;
    });
});

SpecEnd

