//
//  EmplesMenuModelDecorator+Test.m
//  emplesMVCTests
//
//  Created by Vasily Popov on 11/29/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

#import <Specta/Specta.h>
#import <Expecta/Expecta.h>
#import <OCMock/OCMock.h>
#import "EmplesMenuModelDecorator.h"

@interface EmplesMenuModelDecorator(Test)
    
@property (nonatomic, strong, readonly) EmplesMenuModel* model;
-(NSArray*)dataSource;
    
@end

SpecBegin(EmplesMenuModelDecorator)

describe(@"EmplesMenuModelDecorator", ^{
    
    __block EmplesMenuModelDecorator *decorator = nil;
    __block id modelMock = nil;
    beforeEach(^{
        modelMock = OCMClassMock([EmplesMenuModel class]);
        decorator = [[EmplesMenuModelDecorator alloc] initWithModel:modelMock];
    });
    
    it(@"should be exist", ^{
        OCMStub([modelMock dataSource]).andReturn(@[]);
        expect(decorator).notTo.beNil();
        expect(decorator.model).notTo.beNil();
        expect(decorator.dataSource).notTo.beNil();
    });
    
    it(@"should have source", ^{
        OCMStub([modelMock dataSource]).andReturn(@[@"test"]);
        expect(decorator).notTo.beNil();
        expect(decorator.model).notTo.beNil();
        expect(decorator.dataSource).to.haveCount(1);
    });
    
    afterAll(^{
        [modelMock stopMocking];
        modelMock = nil;
        decorator = nil;
    });
});

SpecEnd
