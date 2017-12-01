//
//  EmplesItemRouter+Test.m
//  emplesMVCTests
//
//  Created by Vasily Popov on 11/29/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>
#import "EmplesItemRouter.h"
#import "EmplesRecAreaJSONModel.h"

@interface EmplesItemRouter_Test : XCTestCase

@end

@implementation EmplesItemRouter_Test

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testItemRouter {
    UINavigationController *vc = [UINavigationController new];
    UIWindow *window = [UIWindow new];
    EmplesItemRouter *router = [[EmplesItemRouter alloc] initWithNavigationVC:vc andWindow:window];
    XCTAssertNotNil(router);
    XCTAssertEqual(router.window, window);
    XCTAssertEqual(router.viewController, vc);
    id mock = OCMClassMock([EmplesRecAreaJSONModel class]);
    XCTAssertNoThrow([router navigateToItemDetail:mock]);
}

@end
