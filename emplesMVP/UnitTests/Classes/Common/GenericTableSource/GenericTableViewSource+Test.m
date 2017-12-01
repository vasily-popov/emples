//
//  GenericTableViewSource+Test.m
//  emplesMVCTests
//
//  Created by Vasily Popov on 11/29/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "GenericTableViewSource.h"

@interface GenericTableViewSource_Test : XCTestCase

@end

@implementation GenericTableViewSource_Test

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testInit {
    
    GenericTableViewSource *source = [[GenericTableViewSource alloc] init];
    XCTAssertNotNil(source);
    XCTAssert(source.source.count == 0);
    [source appendItems:@[@1,@2,@3]];
    XCTAssert(source.source.count == 3);
    [source setDataSource:@[@1]];
    XCTAssert(source.source.count == 1);
}

- (void)testInitWithSource {
    
    GenericTableViewSource *source = [[GenericTableViewSource alloc] initWithSource:@[@9, @8]];
    XCTAssertNotNil(source);
    XCTAssert(source.source.count == 2);
    [source appendItems:@[@1,@2,@3]];
    XCTAssert(source.source.count == 5);
    [source setDataSource:@[@1]];
    XCTAssert(source.source.count == 1);
    
}

@end
