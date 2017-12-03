//
//  DataFilePersistenceGateway+Test.m
//  UnitTests
//
//  Created by Vasily Popov on 12/3/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

#import <Specta/Specta.h>
#import <Expecta/Expecta.h>
#import <OCMock/OCMock.h>
#import "DataFilePersistenceGateway.h"
#import "EmplesRecAreaJSONModel.h"
#import "EmplesRecreationArea.h"

SpecBegin(DataFilePersistenceGateway)

describe(@"DataFilePersistenceGateway error case", ^{
    
    __block DataFilePersistenceGateway *gateway;
    __block id mock;
    beforeAll(^{
        mock = OCMProtocolMock(@protocol(FileReaderClientProtocol));
        gateway = [[DataFilePersistenceGateway alloc] initWithClient:mock];
        expect(gateway).notTo.beNil();
        [[mock stub] readAllArea:[OCMArg invokeBlockWithArgs:[NSNull null], [NSError errorWithDomain:@"" code:0 userInfo:nil], nil]];
    });
    
    it(@"should return error", ^{
        waitUntil(^(DoneCallback done) {
            [gateway fetchAllAreas:^(id response, NSError *error) {
                expect(response).to.beNil();
                expect(error).notTo.beNil();
                done();
            }];
        });
    });
    
    afterAll(^{
        [mock stopMocking];
        gateway = nil;
    });
});

describe(@"DataFilePersistenceGateway success case", ^{
    
    __block DataFilePersistenceGateway *gateway;
    __block id mock;
    beforeAll(^{
        mock = OCMProtocolMock(@protocol(FileReaderClientProtocol));
        gateway = [[DataFilePersistenceGateway alloc] initWithClient:mock];
        expect(gateway).notTo.beNil();
        
        //use different approach
        id mockModel = OCMClassMock([EmplesRecAreaJSONModel class]);
        OCMStub([mock readAllArea:[OCMArg any]])
        .andDo(^(NSInvocation *invocation) {
            void (^passedBlock)(id response, NSError *error);
            [invocation getArgument: &passedBlock atIndex: 2];
            passedBlock(@[mockModel], nil);
        });
        
        //[[mock stub] fetchAllAreas:[OCMArg invokeBlockWithArgs:@[[EmplesRecreationArea new]], [NSNull null], nil]];
    });
    
    it(@"should return success", ^{
        waitUntil(^(DoneCallback done) {
            [gateway fetchAllAreas:^(id response, NSError *error) {
                expect(response).notTo.beNil();
                expect(error).to.beNil();
                done();
            }];
        });
    });
    
    afterAll(^{
        [mock stopMocking];
        gateway = nil;
    });
});

SpecEnd
