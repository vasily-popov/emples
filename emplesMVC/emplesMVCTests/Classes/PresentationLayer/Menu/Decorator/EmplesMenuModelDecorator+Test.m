//
//  EmplesMenuModelDecorator+Test.m
//  emplesMVCTests
//
//  Created by Vasily Popov on 11/29/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>
#import "EmplesMenuModelDecorator.h"

@interface EmplesMenuModelDecorator(Test)

@property (nonatomic, strong, readonly) EmplesMenuModel* model;

@end

@interface EmplesMenuModelDecorator_Test : XCTestCase

@end

@implementation EmplesMenuModelDecorator_Test

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testModel {
    id modelMock = OCMClassMock([EmplesMenuModel class]);
    EmplesMenuModelDecorator * decorator = [[EmplesMenuModelDecorator alloc] initWithModel:modelMock];
    XCTAssertNotNil(decorator);
    XCTAssertNotNil(decorator.model);
}

@end
