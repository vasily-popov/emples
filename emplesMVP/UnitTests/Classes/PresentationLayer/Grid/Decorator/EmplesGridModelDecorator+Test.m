//
//  EmplesGridModelDecorator+Test.m
//  emplesMVCTests
//
//  Created by Vasily Popov on 11/29/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

#import <Specta/Specta.h>
#import <Expecta/Expecta.h>
#import <OCMock/OCMock.h>
#import "EmplesGridModelDecorator.h"
#import "EmplesRecAreaJSONModel.h"

@interface EmplesGridModelDecorator(Test)
    
@property (nonatomic, strong, readonly) EmplesAreasModel* model;
    
@end

SpecBegin(EmplesGridModelDecorator)

describe(@"EmplesGridModelDecorator", ^{
    
    __block EmplesGridModelDecorator *decorator = nil;
    __block id mockArea = nil;
    __block id modelMock = nil;
    beforeAll(^{
        modelMock = OCMClassMock([EmplesAreasModel class]);
        mockArea = OCMClassMock([EmplesRecAreaJSONModel class]);
        OCMStub([modelMock dataSource]).andReturn(@[mockArea]);
        decorator = [[EmplesGridModelDecorator alloc] initWithModel:modelMock];
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

