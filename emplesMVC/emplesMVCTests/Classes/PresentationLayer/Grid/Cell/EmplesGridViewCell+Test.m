//
//  EmplesGridViewCell+Test.m
//  emplesMVCTests
//
//  Created by Vasily Popov on 11/29/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>
#import "EmplesGridViewCell.h"
#import "EmplesGridCellModel.h"

@interface EmplesGridViewCell_Test : XCTestCase

@end

@implementation EmplesGridViewCell_Test

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testCell {
    id mock = OCMClassMock([EmplesGridCellModel class]);
    EmplesGridViewCell *cell = [[EmplesGridViewCell alloc] init];
    XCTAssertNotNil(cell);
    XCTAssertNoThrow([cell configureWithModel:mock]);
}

@end
