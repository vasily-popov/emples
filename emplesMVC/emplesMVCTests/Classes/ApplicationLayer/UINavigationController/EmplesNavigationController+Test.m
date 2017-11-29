//
//  EmplesNavigationController+Test.m
//  emplesMVCTests
//
//  Created by Vasily Popov on 11/28/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "EmplesNavigationController.h"

@interface EmplesNavigationController_Test : XCTestCase

@end

@implementation EmplesNavigationController_Test

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testInit {
    
    EmplesNavigationController *nvc = [[EmplesNavigationController alloc] init];
    XCTAssertNotNil(nvc);
    
}

- (void)testInitWithRoot {
    
    EmplesNavigationController *nvc = [[EmplesNavigationController alloc]
                                       initWithRootViewController:[UIViewController new]];
    XCTAssertNotNil(nvc);
    
}


@end
