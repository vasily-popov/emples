//
//  EmplesDetailDescriptionCellModel+Test.m
//  emplesMVCTests
//
//  Created by Vasily Popov on 11/29/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "EmplesDetailDescriptionCellModel.h"

@interface EmplesDetailDescriptionCellModel_Test : XCTestCase

@end

@implementation EmplesDetailDescriptionCellModel_Test

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testModel {
    EmplesDetailDescriptionCellModel *model = [EmplesDetailDescriptionCellModel new];
    XCTAssertNotNil(model);
    model.descriptionText = @"test";
    XCTAssert([[model getModelValue] isEqualToString: @"test"]);
    XCTAssert([[model cellClassName] isEqualToString: @"EmplesDetailTextViewWithImageViewCell"]);
}

@end
