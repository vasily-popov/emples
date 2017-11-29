//
//  EmplesMenuTableViewManager+Test.m
//  emplesMVCTests
//
//  Created by Vasily Popov on 11/29/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>
#import "EmplesMenuTableViewManager.h"

@interface EmplesMenuTableViewManager(Test)

-(void)registerCellsForTable:(UITableView*)tableView;

@end

@interface EmplesMenuTableViewManager_Test : XCTestCase

@end

@implementation EmplesMenuTableViewManager_Test

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testInit {
    
    id mock = OCMClassMock([UITableView class]);
    EmplesMenuTableViewManager *manager = [[EmplesMenuTableViewManager alloc] initWithSource:@[@2]];
    XCTAssertNotNil(manager);
    id dataSource = [manager dataSourceForTableView:mock];
    id delegate = [manager delegateForTableView:mock];
    
    XCTAssertNotNil(dataSource);
    XCTAssertNotNil(delegate);
    XCTAssert([dataSource conformsToProtocol:@protocol(UITableViewDataSource)]);
    XCTAssert([delegate conformsToProtocol:@protocol(UITableViewDelegate)]);
}

@end
