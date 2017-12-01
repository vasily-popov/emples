//
//  EmplesMenuRouter+Router.m
//  emplesMVCTests
//
//  Created by Vasily Popov on 11/29/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "EmplesMenuRouter.h"

@interface EmplesMenuRouter_Router : XCTestCase

@end

@implementation EmplesMenuRouter_Router

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testMenuRouter {
    UINavigationController *vc = [UINavigationController new];
    UIWindow *window = [UIWindow new];
    EmplesMenuRouter *router = [[EmplesMenuRouter alloc] initWithNavigationVC:vc andWindow:window];
    XCTAssertNotNil(router);
    XCTAssertEqual(router.window, window);
    XCTAssertEqual(router.viewController, vc);
    XCTAssertNoThrow([router navigateToSelectedItem:EnumMenuSelectedItemList]);
}

@end
