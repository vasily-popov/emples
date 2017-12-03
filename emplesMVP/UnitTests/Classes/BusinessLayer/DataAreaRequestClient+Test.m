//
//  DataAreaRequestClient+Test.m
//  emplesMVCTests
//
//  Created by Vasily Popov on 11/28/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

#import <Specta/Specta.h>
#import <Expecta/Expecta.h>
#import <OCMock/OCMock.h>
#import "DataAreaRequestClient.h"
#import "EmplesFSJsonReader.h"

@interface DataAreaRequestClient(Test)
    
-(NSArray* ) parseAreaResponse:(id)response error:(NSError**)error;
    
@end


SpecBegin(DataAreaRequestClient)

describe(@"DataAreaRequestClient_nil_factory", ^{
    
    __block DataAreaRequestClient *client;
    beforeAll(^{
        client = [[DataAreaRequestClient alloc] initWithFactory:nil];
        expect(client).notTo.beNil();
    });

    it(@"should parse nil response", ^{
        
        expect(^{
            NSError *error = nil;
            id response = [client parseAreaResponse:nil error:&error];
            expect(response).beNil();
        }).notTo.raiseAny();
    });
    
    it(@"should parse empty array", ^{
        
        expect(^{
            NSError *error = nil;
            id response = [client parseAreaResponse:@[] error:&error];
            expect(error).to.beNil();
            expect(response).toNot.beNil();
            expect(response).to.beEmpty();
        }).notTo.raiseAny();
    });
    
    it(@"should parse valid response with invalid content", ^{
        
        expect(^{
            NSError *error = nil;
            id response = [client parseAreaResponse:@[@{@"id":@"1"}] error:&error]; //missed keys
            expect(error).toNot.beNil();
            expect(response).beNil();
        }).notTo.raiseAny();
    });
    
    afterAll(^{
        client = nil;
    });
});


describe(@"DataAreaRequestClient error case", ^{
    
    __block id mock = OCMProtocolMock(@protocol(DataRequestProtocol));
    __block DataAreaRequestClient *client;
    beforeAll(^{
        client = [[DataAreaRequestClient alloc] initWithFactory:mock];
        expect(client).notTo.beNil();
        [[mock stub] requestToRead:@"RecArea"
                 withResponseBlock:[OCMArg invokeBlockWithArgs:[NSNull null], [NSError errorWithDomain:@"" code:0 userInfo:nil], nil]];
    });
    
    
    it(@"should return error", ^{
        waitUntil(^(DoneCallback done) {
            [client fetchAllAreas:^(id response, NSError *error) {
                expect(error).toNot.beNil();
                expect(response).to.beNil();
                done();
            }];
        });
    });
    
    afterAll(^{
        [mock stopMocking];
        client = nil;
    });
});

describe(@"DataAreaRequestClient success case", ^{
    
    __block id mock = OCMProtocolMock(@protocol(DataRequestProtocol));
    __block DataAreaRequestClient *client;
    beforeAll(^{
        client = [[DataAreaRequestClient alloc] initWithFactory:mock];
        expect(client).notTo.beNil();
        
        //use different approach
        OCMStub([mock requestToRead:@"RecArea" withResponseBlock:[OCMArg any]])
        .andDo(^(NSInvocation *invocation) {
            void (^passedBlock)(id response, NSError *error);
            [invocation getArgument: &passedBlock atIndex: 3];
            passedBlock(@[], nil);
        });
        
        //[[mock stub] requestToRead:@"RecArea"
        //         withResponseBlock:[OCMArg invokeBlockWithArgs:@[], [NSNull null], nil]];
    });
    
    it(@"should fetch areas", ^{
        
        waitUntil(^(DoneCallback done) {
            [client fetchAllAreas:^(id response, NSError *error) {
                expect(error).to.beNil();
                expect(response).toNot.beNil();
                expect(response).to.beKindOf([NSArray class]);
                done();
            }];
        });
    });
    
    afterAll(^{
        [mock stopMocking];
        client = nil;
    });
});

SpecEnd

