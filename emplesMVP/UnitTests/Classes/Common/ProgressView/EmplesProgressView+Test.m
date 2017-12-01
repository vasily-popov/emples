//
//  EmplesProgressView+Test.m
//  emplesMVPTests
//
//  Created by Vasily Popov on 11/29/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "EmplesProgressView.h"

@interface EmplesProgressView_Test : XCTestCase

@end

@implementation EmplesProgressView_Test

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testView {
    
    EmplesProgressView *view = [[EmplesProgressView alloc] initWithFrame:CGRectZero];
    XCTAssertNotNil(view);
    XCTAssertNoThrow([view show]);
    XCTAssertNoThrow([view hide]);
}


@end
