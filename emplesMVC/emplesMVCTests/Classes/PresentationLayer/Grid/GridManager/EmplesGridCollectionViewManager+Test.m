//
//  EmplesGridCollectionViewManager+Test.m
//  emplesMVCTests
//
//  Created by Vasily Popov on 11/29/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>
#import "EmplesGridCollectionViewManager.h"
#import "GenericGridViewSource.h"

@interface EmplesGridCollectionViewManager (Test)

@property (nonatomic, strong, readonly) GenericGridViewSource *dataSource;

@end

@interface EmplesGridCollectionViewManager_Test : XCTestCase

@end

@implementation EmplesGridCollectionViewManager_Test

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testInit {
    
    EmplesGridCollectionViewManager *manager = [[EmplesGridCollectionViewManager alloc] init];
    XCTAssertNil(manager.dataSource);
    [manager appendItems:@[@1,@2,@3]];
    XCTAssert(manager.dataSource.source.count == 3);
    [manager updateDataSource:@[@1]];
    XCTAssert(manager.dataSource.source.count == 1);
    
    id mock = OCMClassMock([UICollectionView class]);
    id dataSource = [manager dataSourceForCollectionView:mock];
    id delegate = [manager delegateForCollectionView:mock];
    
    XCTAssertNotNil(dataSource);
    XCTAssertNotNil(delegate);
    XCTAssert([dataSource conformsToProtocol:@protocol(UICollectionViewDataSource)]);
    XCTAssert([delegate conformsToProtocol:@protocol(UICollectionViewDelegate)]);
}

- (void)testInitWithSource {
    
    EmplesGridCollectionViewManager *manager = [[EmplesGridCollectionViewManager alloc] initWithSource:@[@9, @8]];
    XCTAssertNotNil(manager.dataSource);
    XCTAssert(manager.dataSource.source.count == 2);
    [manager appendItems:@[@1,@2,@3]];
    XCTAssert(manager.dataSource.source.count == 5);
    [manager updateDataSource:@[@1]];
    XCTAssert(manager.dataSource.source.count == 1);
    
    id mock = OCMClassMock([UICollectionView class]);
    id dataSource = [manager dataSourceForCollectionView:mock];
    id delegate = [manager delegateForCollectionView:mock];
    
    XCTAssertNotNil(dataSource);
    XCTAssertNotNil(delegate);
    XCTAssert([dataSource conformsToProtocol:@protocol(UICollectionViewDataSource)]);
    XCTAssert([delegate conformsToProtocol:@protocol(UICollectionViewDelegate)]);
}


- (void)testUpdateEmptyDataSource {
    
    EmplesGridCollectionViewManager *manager = [[EmplesGridCollectionViewManager alloc] init];
    XCTAssertNil(manager.dataSource);
    [manager updateDataSource:@[@1]];
    XCTAssert(manager.dataSource.source.count == 1);
}


- (void)testCreateGridDataSourceWhenSourceIsEmpty {
    
    EmplesGridCollectionViewManager *manager = [[EmplesGridCollectionViewManager alloc] init];
    id mock = OCMClassMock([UICollectionView class]);
    id dataSource = [manager dataSourceForCollectionView:mock];
    XCTAssertNotNil(dataSource);
    XCTAssert([dataSource conformsToProtocol:@protocol(UICollectionViewDataSource)]);
}


@end
