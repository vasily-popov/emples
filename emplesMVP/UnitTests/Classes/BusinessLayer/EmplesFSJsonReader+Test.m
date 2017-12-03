//
//  EmplesFSJsonReader+Test.m
//  emplesMVCTests
//
//  Created by Vasily Popov on 11/28/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

#import <Specta/Specta.h>
#import <Expecta/Expecta.h>
#import "EmplesFSJsonReader.h"
#import "EmplesFileNames.h"

SpecBegin(EmplesFSJsonReader)

describe(@"EmplesFSJsonReader", ^{
    
    __block EmplesFSJsonReader *reader;
    beforeAll(^{
        reader = [EmplesFSJsonReader new];
    });
    
    it(@"should be instance of EmplesFSJsonReader", ^{
        expect(reader).notTo.beNil();
        expect(reader).to.beInstanceOf([EmplesFSJsonReader class]);
    });
    
    it(@"should handle nil filename when fetch areas", ^{
        waitUntil(^(DoneCallback done) {
            [reader requestToRead:nil withResponseBlock:^(id response, NSError *error) {
                expect(response).to.beNil();
                expect(error).notTo.beNil();
                done();
            }];
        });
    });
    
    it(@"should handle invalid filename when fetch areas", ^{
        waitUntil(^(DoneCallback done) {
            [reader requestToRead:@"fake" withResponseBlock:^(id response, NSError *error) {
                expect(response).to.beNil();
                expect(error).notTo.beNil();
                done();
            }];
        });
    });
    
    
    it(@"should read areas from real file", ^{
        waitUntil(^(DoneCallback done) {
            [reader requestToRead:kRecAreaFileName withResponseBlock:^(id response, NSError *error) {
                expect(response).notTo.beNil();
                expect(error).to.beNil();
                done();
            }];
        });
    });
    
    afterAll(^{
        reader = nil;
    });
});

SpecEnd

