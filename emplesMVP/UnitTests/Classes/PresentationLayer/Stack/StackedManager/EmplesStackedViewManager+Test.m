//
//  EmplesStackedViewManager+Test.m
//  emplesMVCTests
//
//  Created by Vasily Popov on 11/29/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>
#import "EmplesStackedViewManager.h"

@interface EmplesStackedViewManager (Test)

@property (nonatomic, strong, readonly) NSArray *dataSource;

@end

@interface EmplesStackedViewManager_Test : XCTestCase

@end

@implementation EmplesStackedViewManager_Test

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testInit {
    
    EmplesStackedViewManager *manager = [[EmplesStackedViewManager alloc] init];
    XCTAssertNil(manager.dataSource);
    [manager appendItems:@[@1,@2,@3]];
    XCTAssert(manager.dataSource.count == 3);
    [manager updateDataSource:@[@1]];
    XCTAssert(manager.dataSource.count == 1);
    
    id mock = OCMClassMock([ZLSwipeableView class]);
    id dataSource = [manager dataSourceForStackedView:mock];
    id delegate = [manager delegateForStackedView:mock];
    
    XCTAssertNotNil(dataSource);
    XCTAssertNotNil(delegate);
    XCTAssert([dataSource conformsToProtocol:@protocol(ZLSwipeableViewDataSource)]);
    XCTAssert([delegate conformsToProtocol:@protocol(ZLSwipeableViewDelegate)]);
}

- (void)testInitWithSource {
    
    EmplesStackedViewManager *manager = [[EmplesStackedViewManager alloc] initWithSource:@[@9, @8]];
    XCTAssertNotNil(manager.dataSource);
    XCTAssert(manager.dataSource.count == 2);
    [manager appendItems:@[@1,@2,@3]];
    XCTAssert(manager.dataSource.count == 5);
    [manager updateDataSource:@[@1]];
    XCTAssert(manager.dataSource.count == 1);
    
    id mock = OCMClassMock([ZLSwipeableView class]);
    id dataSource = [manager dataSourceForStackedView:mock];
    id delegate = [manager delegateForStackedView:mock];
    
    XCTAssertNotNil(dataSource);
    XCTAssertNotNil(delegate);
    XCTAssert([dataSource conformsToProtocol:@protocol(ZLSwipeableViewDataSource)]);
    XCTAssert([delegate conformsToProtocol:@protocol(ZLSwipeableViewDelegate)]);
}


- (void)testUpdateEmptyDataSource {
    
    EmplesStackedViewManager *manager = [[EmplesStackedViewManager alloc] init];
    XCTAssertNil(manager.dataSource);
    [manager updateDataSource:@[@1]];
    XCTAssert(manager.dataSource.count == 1);
}


- (void)testCreateStackDataSourceWhenSourceIsEmpty {
    
    EmplesStackedViewManager *manager = [[EmplesStackedViewManager alloc] init];
    id mock = OCMClassMock([ZLSwipeableView class]);
    id dataSource = [manager dataSourceForStackedView:mock];
    XCTAssertNotNil(dataSource);
    XCTAssert([dataSource conformsToProtocol:@protocol(ZLSwipeableViewDataSource)]);
}

@end
