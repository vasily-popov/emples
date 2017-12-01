//
//  EmplesListModelDecorator+Test.m
//  emplesMVCTests
//
//  Created by Vasily Popov on 11/29/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>
#import "EmplesListModelDecorator.h"
#import "EmplesRecAreaJSONModel.h"

@interface EmplesListModelDecorator(Test)

@property (nonatomic, strong, readonly) EmplesAreasModel* model;

@end

@interface EmplesListModelDecorator_Test : XCTestCase

@end

@implementation EmplesListModelDecorator_Test

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testModel {
    id modelMock = OCMClassMock([EmplesAreasModel class]);
    id mockArea = OCMClassMock([EmplesRecAreaJSONModel class]);
    OCMStub([modelMock dataSource]).andReturn(@[mockArea]);
    EmplesListModelDecorator * decorator = [[EmplesListModelDecorator alloc] initWithModel:modelMock];
    XCTAssertNotNil(decorator);
    XCTAssertNotNil(decorator.model);
    XCTAssertNotNil(decorator.dataSource);
    XCTAssert(decorator.dataSource.count == 1);
}

@end
