//
//  EmplesMenuView+Test.m
//  emplesMVCTests
//
//  Created by Vasily Popov on 11/29/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "EmplesMenuView.h"
#import "EmplesDetailTableViewManager.h"

@interface EmplesMenuView(Test)

@property (strong, nonatomic, readonly) UITableView *table;
@property (strong, nonatomic, readonly) EmplesDetailTableViewManager *sourceManager;

@end

@interface EmplesMenuView_Test : XCTestCase

@end

@implementation EmplesMenuView_Test

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testMenuView {
    
    EmplesMenuView *view = [EmplesMenuView new];
    XCTAssertNotNil(view);
    XCTAssertNoThrow([view viewDidLoad]);
    XCTAssertNotNil(view.table);
    XCTAssertNotNil(view.sourceManager);
    XCTAssertNoThrow([view didReceiveMemoryWarning]);
}

@end
