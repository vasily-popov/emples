//
//  EmplesDetailController+Test.m
//  emplesMVCTests
//
//  Created by Vasily Popov on 11/29/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>
#import "EmplesDetailController.h"

@interface EmplesDetailController (Test)

@property (nonatomic, strong) EmplesDetailAreaModel *model;

@end

@interface EmplesDetailController_Test : XCTestCase

@end

@implementation EmplesDetailController_Test

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testInitWithModel {
    id modelMock = OCMClassMock([EmplesDetailAreaModel class]);
    id viewMock = OCMClassMock([EmplesDetailView class]);
    EmplesDetailController * controller = [[EmplesDetailController alloc] initWithModel:modelMock];
    XCTAssertNotNil(controller);
    XCTAssertNotNil(controller.model);
    controller.view = viewMock;
    XCTAssertNotNil(controller.view);
}

@end
