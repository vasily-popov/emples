//
//  GenericTableViewManager+Test.m
//  emplesMVCTests
//
//  Created by Vasily Popov on 11/29/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "GenericTableViewManager.h"
#import "GenericTableViewSource.h"
#import <OCMock/OCMock.h>

@interface GenericTableViewManager (Test)

@property (nonatomic, strong, readonly) GenericTableViewSource *dataSource;

@end

@interface GenericTableViewManager_Test : XCTestCase

@end

@implementation GenericTableViewManager_Test

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testInit {
    
    GenericTableViewManager *manager = [[GenericTableViewManager alloc] init];
    XCTAssertNil(manager.dataSource);
    [manager appendItems:@[@1,@2,@3]];
    XCTAssert(manager.dataSource.source.count == 3);
    [manager updateDataSource:@[@1]];
    XCTAssert(manager.dataSource.source.count == 1);
    
    id mock = OCMClassMock([UITableView class]);
    id dataSource = [manager dataSourceForTableView:mock];
    id delegate = [manager delegateForTableView:mock];
    
    XCTAssertNotNil(dataSource);
    XCTAssertNotNil(delegate);
    XCTAssert([dataSource conformsToProtocol:@protocol(UITableViewDataSource)]);
    XCTAssert([delegate conformsToProtocol:@protocol(UITableViewDelegate)]);
}

- (void)testInitWithSource {
    
    GenericTableViewManager *manager = [[GenericTableViewManager alloc] initWithSource:@[@9, @8]];
    XCTAssertNotNil(manager.dataSource);
    XCTAssert(manager.dataSource.source.count == 2);
    [manager appendItems:@[@1,@2,@3]];
    XCTAssert(manager.dataSource.source.count == 5);
    [manager updateDataSource:@[@1]];
    XCTAssert(manager.dataSource.source.count == 1);
    
    id mock = OCMClassMock([UITableView class]);
    id dataSource = [manager dataSourceForTableView:mock];
    id delegate = [manager delegateForTableView:mock];
    
    XCTAssertNotNil(dataSource);
    XCTAssertNotNil(delegate);
    XCTAssert([dataSource conformsToProtocol:@protocol(UITableViewDataSource)]);
    XCTAssert([delegate conformsToProtocol:@protocol(UITableViewDelegate)]);
}


- (void)testUpdateEmptyDataSource {
    
    GenericTableViewManager *manager = [[GenericTableViewManager alloc] init];
    XCTAssertNil(manager.dataSource);
    [manager updateDataSource:@[@1]];
    XCTAssert(manager.dataSource.source.count == 1);
}


- (void)testCreateTableDataSourceWhenSourceIsEmpty {
    
    GenericTableViewManager *manager = [[GenericTableViewManager alloc] init];
    id mock = OCMClassMock([UITableView class]);
    id dataSource = [manager dataSourceForTableView:mock];
    XCTAssertNotNil(dataSource);
    XCTAssert([dataSource conformsToProtocol:@protocol(UITableViewDataSource)]);
}

@end
