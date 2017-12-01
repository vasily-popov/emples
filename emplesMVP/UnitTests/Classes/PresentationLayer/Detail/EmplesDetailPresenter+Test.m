//
//  EmplesDetailController+Test.m
//  emplesMVCTests
//
//  Created by Vasily Popov on 11/29/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>
#import "EmplesDetailPresenter.h"

@interface EmplesDetailPresenter (Test)

@property (nonatomic, strong) EmplesDetailAreaModel *model;

@end

@interface EmplesDetailPresenter_Test : XCTestCase

@end

@implementation EmplesDetailPresenter_Test

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
    EmplesDetailPresenter * presenter = [[EmplesDetailPresenter alloc] initWithModel:modelMock];
    XCTAssertNotNil(presenter);
    XCTAssertNotNil(presenter.model);
    presenter.view = viewMock;
    XCTAssertNotNil(presenter.view);
    XCTAssertNoThrow([presenter viewDidLoad]);
}

@end
