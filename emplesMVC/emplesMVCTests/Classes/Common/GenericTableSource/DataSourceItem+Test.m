//
//  DataSourceItem+Test.m
//  emplesMVCTests
//
//  Created by Vasily Popov on 11/29/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>
#import "DataSourceItem.h"

@interface DataSourceItem_Test : XCTestCase

@end

@implementation DataSourceItem_Test

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testInit {
    
    DataSourceItem *item = [[DataSourceItem alloc] initWithCellModel:nil];
    XCTAssertNotNil(item);
    XCTAssertNil(item.value);
    XCTAssertNil(item.cellModel);
}

- (void)testInitWitCellProtocol {
    id mockProtocol = OCMProtocolMock(@protocol(ViewCellModelProtocol));
    DataSourceItem *item = [[DataSourceItem alloc] initWithCellModel:mockProtocol];
    XCTAssertNotNil(item);
    XCTAssertNotNil(item.cellModel);
    
}


@end
