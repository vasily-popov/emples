//
//  EmplesItemView+Test.m
//  emplesMVCTests
//
//  Created by Vasily Popov on 11/29/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>
#import "EmplesItemView.h"
#import "EmplesListCellModel.h"

@interface EmplesItemView_Test : XCTestCase

@end

@implementation EmplesItemView_Test

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testView {
    id mock = OCMClassMock([EmplesListCellModel class]);
    EmplesItemView *view = [[EmplesItemView alloc] init];
    XCTAssertNotNil(view);
    XCTAssertNoThrow([view awakeFromNib]);
    XCTAssertNoThrow([view configureWithModel:mock]);
}
@end
