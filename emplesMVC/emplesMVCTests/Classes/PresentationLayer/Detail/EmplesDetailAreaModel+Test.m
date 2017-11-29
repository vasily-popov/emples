//
//  EmplesDetailAreaModel+Test.m
//  emplesMVCTests
//
//  Created by Vasily Popov on 11/29/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>
#import "EmplesDetailAreaModel.h"
#import "EmplesRecAreaJSONModel.h"

@interface EmplesDetailAreaModel(Test)

@property (nonatomic, strong, readonly) EmplesRecAreaJSONModel* model;
@property (nonatomic, strong, readonly) NSArray* dataSource;

@end

@interface EmplesDetailAreaModel_Test : XCTestCase

@end

@implementation EmplesDetailAreaModel_Test

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testModel {
    id modelMock = OCMClassMock([EmplesRecAreaJSONModel class]);
    OCMStub([modelMock RecAreaName]).andReturn(@"test");
    EmplesDetailAreaModel * area = [[EmplesDetailAreaModel alloc] initWithItem:modelMock];
    XCTAssertNotNil(area);
    XCTAssertNotNil(area.model);
    XCTAssertNotNil(area.dataSource);
    XCTAssertNotNil([area titleName]);
    XCTAssert([[area titleName] isEqualToString:@"test"]);
}

@end
