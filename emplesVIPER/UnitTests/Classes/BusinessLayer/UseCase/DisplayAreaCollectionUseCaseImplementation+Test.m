//
//  DisplayAreaCollectionUseCaseImplementation+Test.m
//  UnitTests
//
//  Created by Vasily Popov on 12/3/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

#import <Specta/Specta.h>
#import <Expecta/Expecta.h>
#import <OCMock/OCMock.h>
#import "DisplayAreaCollectionUseCaseImplementation.h"
#import "EmplesRecAreaJSONModel.h"
#import "EmplesRecreationArea.h"

SpecBegin(DisplayAreaCollectionUseCaseImplementation)

describe(@"DisplayAreaCollectionUseCaseImplementation error case", ^{
    
    __block DisplayAreaCollectionUseCaseImplementation *useCase;
    __block id mock;
    beforeAll(^{
        mock = OCMProtocolMock(@protocol(DataAreaGatewayProtocol));
        useCase = [[DisplayAreaCollectionUseCaseImplementation alloc] initWithGateway:mock];
        expect(useCase).notTo.beNil();
        [[mock stub] fetchAllAreas:[OCMArg invokeBlockWithArgs:[NSNull null], [NSError errorWithDomain:@"" code:0 userInfo:nil], nil]];
    });
    
    it(@"should return error", ^{
        waitUntil(^(DoneCallback done) {
            [useCase displayAreaCollection:^(NSArray *areas, NSError *error) {
                expect(areas).to.beNil();
                expect(error).notTo.beNil();
                done();
            }];
        });
    });
    
    afterAll(^{
        [mock stopMocking];
        useCase = nil;
    });
});

describe(@"DisplayAreaCollectionUseCaseImplementation success case", ^{
    
    __block DisplayAreaCollectionUseCaseImplementation *useCase;
    __block id mock;
    beforeAll(^{
        mock = OCMProtocolMock(@protocol(DataAreaGatewayProtocol));
        useCase = [[DisplayAreaCollectionUseCaseImplementation alloc] initWithGateway:mock];
        expect(useCase).notTo.beNil();
        
        //use different approach
        
        id mockModel = OCMClassMock([EmplesRecAreaJSONModel class]);
        OCMStub([mockModel ponsoObject]).andReturn([EmplesRecreationArea new]);
        OCMStub([mock fetchAllAreas:[OCMArg any]])
        .andDo(^(NSInvocation *invocation) {
            void (^passedBlock)(id response, NSError *error);
            [invocation getArgument: &passedBlock atIndex: 2];
            passedBlock(@[mockModel], nil);
        });
        
        //[[mock stub] fetchAllAreas:[OCMArg invokeBlockWithArgs:@[[EmplesRecreationArea new]], [NSNull null], nil]];
    });
    
    it(@"should return success", ^{
        waitUntil(^(DoneCallback done) {
            [useCase displayAreaCollection:^(NSArray *areas, NSError *error) {
                expect(areas).notTo.beNil();
                expect(error).to.beNil();
                done();
            }];
        });
    });
    
    afterAll(^{
        [mock stopMocking];
        useCase = nil;
    });
});

SpecEnd
