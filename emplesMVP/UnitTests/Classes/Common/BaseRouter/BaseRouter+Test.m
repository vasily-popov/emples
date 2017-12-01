//
//  BaseRouter+Test.m
//  emplesMVCTests
//
//  Created by Vasily Popov on 11/29/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "BaseRouter.h"

@interface BaseRouter_Test : XCTestCase

@end

@implementation BaseRouter_Test

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testInit {
    
    BaseRouter *router = [[BaseRouter alloc] init];
    XCTAssertNotNil(router);
    XCTAssertNil(router.window);
    XCTAssertNil(router.viewController);
    XCTAssertNoThrow([router prepareForSegue:nil sender:nil]);
    XCTAssertNoThrow([router setRootViewController:nil]);
    XCTAssertNoThrow([router popViewControllerAnimated:NO]);
    XCTAssertNoThrow([router popToRootViewControllerAnimated:NO]);
    XCTAssertNoThrow([router dismissViewControllerAnimated:NO completion:nil]);
    XCTAssertNoThrow([router showAlertWithTitle:nil message:nil]);
}

- (void)testInitWitCellProtocol {
    UINavigationController *vc = [UINavigationController new];
    UIWindow *window = [UIWindow new];
    BaseRouter *router = [[BaseRouter alloc] initWithNavigationVC:vc andWindow:window];
    XCTAssertNotNil(router);
    XCTAssertEqual(router.window, window);
    XCTAssertEqual(router.viewController, vc);
    XCTAssertNoThrow([router prepareForSegue:nil sender:nil]);
    XCTAssertNoThrow([router setRootViewController:nil]);
    XCTAssertNoThrow([router popViewControllerAnimated:NO]);
    XCTAssertNoThrow([router popToRootViewControllerAnimated:NO]);
    XCTAssertNoThrow([router dismissViewControllerAnimated:NO completion:nil]);
    XCTAssertNoThrow([router showAlertWithTitle:nil message:nil]);
    
}

@end
