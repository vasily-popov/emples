//
//  DataAreaRequestClient+Test.m
//  emplesMVCTests
//
//  Created by Vasily Popov on 11/28/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

#import <Specta/Specta.h>
#import <Expecta/Expecta.h>
#import "DataAreaRequestClient.h"
#import "EmplesFSJsonReader.h"

SpecBegin(DataAreaRequestClient)

describe(@"DataAreaRequestClient", ^{
    
    __block DataAreaRequestClient *client;
    __block EmplesFSJsonReader *reader;
    
    beforeAll(^{
        // This is run once and only once before all of the examples
        // in this group and before any beforeEach blocks.
         reader = [[EmplesFSJsonReader alloc] init];
    });
    
    beforeEach(^{
        // This is run before each example.
        client = [[DataAreaRequestClient alloc] initWithFactory:reader];
    });
    
    
    it(@"should get all areas", ^{
        
        waitUntil(^(DoneCallback done) {
            [client fetchAllAreas:^(id response, NSError *error) {
                if(error) {
                    failure(@"This should not happen");
                }
                else {
                    expect(response).to.beKindOf([NSArray class]);
                }
                done();
            }];
        });
    });
    
    
    
    afterEach(^{
        // This is run after each example.
        client = nil;
    });
    
    afterAll(^{
        // This is run once and only once after all of the examples
        // in this group and after any afterEach blocks.
        reader = nil;
    });
});

SpecEnd
