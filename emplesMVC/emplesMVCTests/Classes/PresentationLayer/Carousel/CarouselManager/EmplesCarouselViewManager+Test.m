//
//  EmplesCarouselViewManager+Test.m
//  emplesMVCTests
//
//  Created by Vasily Popov on 11/29/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>
#import "EmplesCarouselViewManager.h"

@interface EmplesCarouselViewManager (Test)

@property (nonatomic, strong, readonly) NSArray *dataSource;

@end

@interface EmplesCarouselViewManager_Test : XCTestCase

@end

@implementation EmplesCarouselViewManager_Test

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testInit {
    
    EmplesCarouselViewManager *manager = [[EmplesCarouselViewManager alloc] init];
    XCTAssertNil(manager.dataSource);
    [manager appendItems:@[@1,@2,@3]];
    XCTAssert(manager.dataSource.count == 3);
    [manager updateDataSource:@[@1]];
    XCTAssert(manager.dataSource.count == 1);
    
    id mock = OCMClassMock([iCarousel class]);
    id dataSource = [manager dataSourceForCarouselView:mock];
    id delegate = [manager delegateForCarouselView:mock];
    
    XCTAssertNotNil(dataSource);
    XCTAssertNotNil(delegate);
    XCTAssert([dataSource conformsToProtocol:@protocol(iCarouselDataSource)]);
    XCTAssert([delegate conformsToProtocol:@protocol(iCarouselDelegate)]);
}

- (void)testInitWithSource {
    
    EmplesCarouselViewManager *manager = [[EmplesCarouselViewManager alloc] initWithSource:@[@9, @8]];
    XCTAssertNotNil(manager.dataSource);
    XCTAssert(manager.dataSource.count == 2);
    [manager appendItems:@[@1,@2,@3]];
    XCTAssert(manager.dataSource.count == 5);
    [manager updateDataSource:@[@1]];
    XCTAssert(manager.dataSource.count == 1);
    
    id mock = OCMClassMock([iCarousel class]);
    id dataSource = [manager dataSourceForCarouselView:mock];
    id delegate = [manager delegateForCarouselView:mock];
    
    XCTAssertNotNil(dataSource);
    XCTAssertNotNil(delegate);
    XCTAssert([dataSource conformsToProtocol:@protocol(iCarouselDataSource)]);
    XCTAssert([delegate conformsToProtocol:@protocol(iCarouselDelegate)]);
}


- (void)testUpdateEmptyDataSource {
    
    EmplesCarouselViewManager *manager = [[EmplesCarouselViewManager alloc] init];
    XCTAssertNil(manager.dataSource);
    [manager updateDataSource:@[@1]];
    XCTAssert(manager.dataSource.count == 1);
}


- (void)testCreateStackDataSourceWhenSourceIsEmpty {
    
    EmplesCarouselViewManager *manager = [[EmplesCarouselViewManager alloc] init];
    id mock = OCMClassMock([iCarousel class]);
    id dataSource = [manager dataSourceForCarouselView:mock];
    XCTAssertNotNil(dataSource);
    XCTAssert([dataSource conformsToProtocol:@protocol(iCarouselDataSource)]);
}

@end
