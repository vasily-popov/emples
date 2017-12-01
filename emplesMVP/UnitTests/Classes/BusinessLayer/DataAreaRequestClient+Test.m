//
//  DataAreaRequestClient+Test.m
//  emplesMVCTests
//
//  Created by Vasily Popov on 11/28/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>
#import "DataAreaRequestClient.h"
#import "EmplesFSJsonReader.h"


@interface DataAreaRequestClient(Test)

-(NSArray* ) parseAreaResponse:(id)response error:(NSError**)error;
-(id<DataRequestProtocol>) factory;

@end

@interface DataAreaRequestClient_Test : XCTestCase

@end

@implementation DataAreaRequestClient_Test

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testInit {
    
    DataAreaRequestClient *client = [[DataAreaRequestClient alloc] initWithFactory:nil];
    XCTAssertNotNil(client);
}

- (void)testInit2 {
    id mockProtocol = OCMProtocolMock(@protocol(DataRequestProtocol));
    DataAreaRequestClient *client = [[DataAreaRequestClient alloc] initWithFactory:mockProtocol];
    XCTAssertEqual(client.factory, mockProtocol);
}

- (void)testFetchAreas {
    
    id mock = OCMClassMock([EmplesFSJsonReader class]);
    DataAreaRequestClient *client = [[DataAreaRequestClient alloc] initWithFactory:mock];
    XCTAssertNoThrow([client fetchAllAreas:nil]);
}

- (void)testParseNilResponse {
    DataAreaRequestClient *client = [[DataAreaRequestClient alloc] initWithFactory:nil];
    
    NSError *error = nil;
    XCTAssertNoThrow([client parseAreaResponse:nil error:&error]);
}

- (void)testParseEmptyArratResponse {
    DataAreaRequestClient *client = [[DataAreaRequestClient alloc] initWithFactory:nil];
    
    NSError *error = nil;
    id res = [client parseAreaResponse:@[] error:&error];
    XCTAssertNotNil(res);
}


- (void)testParseMissedKeyResponse {
    DataAreaRequestClient *client = [[DataAreaRequestClient alloc] initWithFactory:nil];
    
    NSError *error = nil;
    id res = [client parseAreaResponse:@[@{@"id":@"1"}] error:&error];
    XCTAssertNil(res);
    XCTAssertNotNil(error);
}



@end
