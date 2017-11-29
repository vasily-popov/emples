//
//  EmplesGridModelDecorator+Test.m
//  emplesMVCTests
//
//  Created by Vasily Popov on 11/29/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>
#import "EmplesGridModelDecorator.h"

@interface EmplesGridModelDecorator(Test)

@property (nonatomic, strong, readonly) EmplesAreasModel* model;

@end

@interface EmplesGridModelDecorator_Test : XCTestCase

@end

@implementation EmplesGridModelDecorator_Test

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
    EmplesGridModelDecorator * decorator = [[EmplesGridModelDecorator alloc] initWithModel:modelMock];
    XCTAssertNotNil(decorator);
    XCTAssertNotNil(decorator.model);
}

@end
