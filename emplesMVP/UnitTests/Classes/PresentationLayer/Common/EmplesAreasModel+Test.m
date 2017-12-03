//
//  EmplesAreasModel+Test.m
//  emplesMVCTests
//
//  Created by Vasily Popov on 11/29/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

#import <Specta/Specta.h>
#import <Expecta/Expecta.h>
#import <OCMock/OCMock.h>
#import "EmplesAreasModel.h"

@interface EmplesAreasModel(Test)
    
@property (nonatomic, strong, readonly) DataAreaRequestClient* client;
    
@end

SpecBegin(EmplesAreasModel)


describe(@"EmplesAreasModel", ^{
    
    __block EmplesAreasModel *model = nil;
    __block id mock = nil;
    __block id <EmplesAreasProtocolDelegate> delegateArea;
    beforeAll(^{
        mock = OCMClassMock([DataAreaRequestClient class]);
        model = [[EmplesAreasModel alloc] initWithClient:mock];
        delegateArea = OCMProtocolMock(@protocol(EmplesAreasProtocolDelegate));
        model.delegate = delegateArea;
        
        OCMStub([mock fetchAllAreas:[OCMArg any]])
        .andDo(^(NSInvocation *invocation) {
            void (^passedBlock)(id response, NSError *error);
            [invocation getArgument: &passedBlock atIndex: 2];
            passedBlock(@[], nil);
        });
    });
    
    it(@"should be exist", ^{
        expect(model).notTo.beNil();
        expect(model.client).notTo.beNil();
        expect(model.dataSource).to.beNil();
    });
    
    it(@"should fetch areas", ^{
        expect(^{
            [model fetchAreas];
        }).notTo.raiseAny();
        
        OCMVerify([mock fetchAllAreas:[OCMArg any]]);
        
    });
    
    it(@"should call delegate", ^{
        expect(^{
            [model fetchAreas];
        }).notTo.raiseAny();
        OCMVerify([delegateArea areasModel:model didFinishWithResponse:[OCMArg any]]);
    });
    
    afterAll(^{
        [mock stopMocking];
        mock = nil;
        delegateArea = nil;
        model = nil;
    });
});

SpecEnd


