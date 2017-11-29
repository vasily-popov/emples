//
//  EmplesListCellView+Test.m
//  emplesMVCTests
//
//  Created by Vasily Popov on 11/29/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>
#import "EmplesListCellView.h"
#import "EmplesListCellModel.h"

@interface EmplesListCellView_Test : XCTestCase

@end

@implementation EmplesListCellView_Test

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testCell {
    id mock = OCMClassMock([EmplesListCellModel class]);
    EmplesListCellView *cell = [[EmplesListCellView alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"resuse"];
    XCTAssertNotNil(cell);
    XCTAssertNoThrow([cell configureWithModel:mock]);
}

@end
