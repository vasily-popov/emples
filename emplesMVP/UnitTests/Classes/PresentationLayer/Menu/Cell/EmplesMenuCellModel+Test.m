//
//  EmplesMenuCellModel+Test.m
//  emplesMVCTests
//
//  Created by Vasily Popov on 11/29/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "EmplesMenuCellModel.h"

@interface EmplesMenuCellModel_Test : XCTestCase

@end

@implementation EmplesMenuCellModel_Test

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testModel {
    EmplesMenuCellModel *model = [EmplesMenuCellModel new];
    XCTAssertNotNil(model);
    model.text = @"test";
    XCTAssert([[model getModelValue] isEqualToString: @"test"]);
    XCTAssert([[model cellClassName] isEqualToString: @"EmplesMenuViewCell"]);
}

@end
