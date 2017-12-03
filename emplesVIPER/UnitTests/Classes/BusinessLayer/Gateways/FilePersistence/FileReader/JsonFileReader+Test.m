//
//  JsonFileReader+Test.m
//  UnitTests
//
//  Created by Vasily Popov on 12/3/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

#import <Specta/Specta.h>
#import <Expecta/Expecta.h>
#import <OCMock/OCMock.h>
#import "JsonFileReader.h"
#import "EmplesFileNames.h"

@interface JsonFileReader (Test)

-(id) readFileWithName:(NSString*)name error:(NSError **)error;

@end

SpecBegin(JsonFileReader)

describe(@"JsonFileReader", ^{
    
    __block JsonFileReader *reader;
    beforeAll(^{
        reader = [[JsonFileReader alloc] init];
        expect(reader).notTo.beNil();
    });
    
    it(@"should return success", ^{
        waitUntil(^(DoneCallback done) {
            [reader readAllArea:^(id response, NSError *error) {
                expect(error).to.beNil();
                expect(response).notTo.beNil();
                done();
            }];
        });
    });
    
    afterAll(^{
        reader = nil;
    });
});

describe(@"JsonFileReader init", ^{
    
    __block JsonFileReader *reader;
    beforeAll(^{
        reader = [JsonFileReader new];
    });
    
    it(@"should be instance of EmplesFSJsonReader", ^{
        expect(reader).notTo.beNil();
        expect(reader).to.beInstanceOf([JsonFileReader class]);
    });
    
    it(@"should handle nil filename when fetch areas", ^{
        expect(^{
            id result = [reader readFileWithName:nil error:nil];
            expect(result).to.beNil();
        }).notTo.raiseAny();
    });
    
    it(@"should handle invalid filename when fetch areas", ^{
        expect(^{
            NSError *error = nil;
            id result = [reader readFileWithName:@"fake" error:&error];
            expect(error).notTo.beNil();
            expect(result).to.beNil();
        }).notTo.raiseAny();
    });
    
    it(@"should read areas from real file", ^{
        expect(^{
            NSError *error = nil;
            id result = [reader readFileWithName:kRecAreaFileName error:&error];
            expect(error).to.beNil();
            expect(result).notTo.beNil();
        }).notTo.raiseAny();
    });
    
    afterAll(^{
        reader = nil;
    });
});

SpecEnd
