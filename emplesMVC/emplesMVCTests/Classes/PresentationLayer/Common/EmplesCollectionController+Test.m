//
//  EmplesCollectionController+Test.m
//  emplesMVCTests
//
//  Created by Vasily Popov on 11/29/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>
#import "EmplesCollectionController.h"
#import "EmplesAreasModel.h"

@interface EmplesCollectionController()

@property (nonatomic, strong, readonly) EmplesAreasModel *model;

@end

@interface EmplesCollectionController_Test : XCTestCase

@end

@implementation EmplesCollectionController_Test

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testInitWithModel {
    id modelMock = OCMClassMock([EmplesAreasModel class]);
    id routerMock = OCMClassMock([EmplesItemRouter class]);
    id viewMock = OCMProtocolMock(@protocol(EmplesCollectionViewProtocol));
    EmplesCollectionController * controller = [[EmplesCollectionController alloc] initWithModel:modelMock];
    XCTAssertNotNil(controller);
    XCTAssertNotNil(controller.model);
    controller.view = viewMock;
    controller.router = routerMock;
    XCTAssertNoThrow([controller viewDidLoad]);
    OCMVerify([modelMock fetchAreas]);
}

@end
