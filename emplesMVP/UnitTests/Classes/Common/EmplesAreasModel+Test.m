//
//  EmplesAreasModel+Test.m
//  emplesMVCTests
//
//  Created by Vasily Popov on 11/29/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>
#import "EmplesAreasModel.h"

@interface EmplesAreasModel(Test)

@property (nonatomic, strong, readonly) DataAreaRequestClient* client;

@end

@interface EmplesAreasModel_Test : XCTestCase

@end

@implementation EmplesAreasModel_Test

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testModel {
    id client = OCMClassMock([DataAreaRequestClient class]);
    EmplesAreasModel *model = [[EmplesAreasModel alloc] initWithClient:client];
    XCTAssertNotNil(model);
    XCTAssertNotNil(model.client);
    XCTAssertNil(model.dataSource);
    XCTAssertNoThrow([model fetchAreas]);
}

@end
