//
//  EmplesListCellModel+Test.m
//  emplesMVCTests
//
//  Created by Vasily Popov on 11/29/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "EmplesListCellModel.h"

@interface EmplesListCellModel_Test : XCTestCase

@end

@implementation EmplesListCellModel_Test

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testModel {
    EmplesListCellModel *model = [EmplesListCellModel new];
    XCTAssertNotNil(model);
    model.text = @"test";
    XCTAssert([[model getModelValue] isEqualToString: @"test"]);
    XCTAssert([[model cellClassName] isEqualToString: @"EmplesListCellView"]);
}

@end
