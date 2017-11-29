//
//  EmplesMenuModel+Test.m
//  emplesMVCTests
//
//  Created by Vasily Popov on 11/29/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "EmplesMenuModel.h"

@interface EmplesMenuModel_Test : XCTestCase

@end

@implementation EmplesMenuModel_Test

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testModel {
    
    EmplesMenuModel *view = [EmplesMenuModel new];
    XCTAssertNotNil(view);
    XCTAssertNotNil(view.dataSource);
    XCTAssertEqual(view.dataSource.count, 5);
}

@end
