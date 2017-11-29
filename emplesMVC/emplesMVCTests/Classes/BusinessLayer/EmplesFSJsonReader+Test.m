//
//  EmplesFSJsonReader+Test.m
//  emplesMVCTests
//
//  Created by Vasily Popov on 11/28/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "EmplesFSJsonReader.h"
#import "EmplesFileNames.h"

@interface EmplesFSJsonReader(Test)

-(id) readFileWithName:(NSString*)name error:(NSError **)error;

@end

@interface EmplesFSJsonReader_Test : XCTestCase
{
    EmplesFSJsonReader *reader;
}

@end

@implementation EmplesFSJsonReader_Test

- (void)setUp {
    [super setUp];
    reader = [EmplesFSJsonReader new];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    self->reader = nil;
    [super tearDown];
}

- (void)testFetchAreas {
    
    XCTestExpectation *expectation = [self expectationWithDescription:@"TestFetchAreas"];
    [reader doRequestToFetchAllAreaWithResponseBlock:^(id response, NSError *error) {
        [expectation fulfill];
    }];
    
    [self waitForExpectationsWithTimeout:5.0 handler:^(NSError *error) {
        if(error)
        {
            XCTFail(@"Expectation Failed with error: %@", error);
        }
    }];
}

- (void)testReadFileWithNilName {
    id result = [reader readFileWithName:nil error:nil];
    XCTAssertNil(result);
}

- (void)testReadFileWithNilNameAndError {
    NSError *error = nil;
    id result = [reader readFileWithName:nil error:&error];
    XCTAssertNil(result);
    XCTAssertNotNil(error);
}

- (void)testReadFileWithFakeNameAndError {
    NSError *error = nil;
    id result = [reader readFileWithName:@"fake" error:&error];
    XCTAssertNil(result);
    XCTAssertNotNil(error);
}

- (void)testReadFileWithRealNameAndError {
    NSError *error = nil;
    id result = [reader readFileWithName:kRecAreaFileName error:&error];
    XCTAssertNotNil(result);
    XCTAssertNil(error);
    XCTAssert([result isKindOfClass:[NSArray class]]);
}

@end
