//
//  DataGridSourceItem+Test.m
//  emplesMVCTests
//
//  Created by Vasily Popov on 11/28/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "DataGridSourceItem.h"
#import <OCMock/OCMock.h>

@interface DataGridSourceItem_Test : XCTestCase

@end

@implementation DataGridSourceItem_Test

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testInit {
    
    DataGridSourceItem *item = [[DataGridSourceItem alloc] initWithCellModel:nil];
    XCTAssertNotNil(item);
    CGSize size = item.itemSize;
    XCTAssert(size.height != 0 && size.width != 0);
    XCTAssertNil(item.value);
    XCTAssertNil(item.cellModel);
}

- (void)testInitWitCellProtocol {
    id mockProtocol = OCMProtocolMock(@protocol(ViewCellModelProtocol));
    DataGridSourceItem *item = [[DataGridSourceItem alloc] initWithCellModel:mockProtocol];
    XCTAssertNotNil(item);
    XCTAssert(item.itemSize.height != 0 && item.itemSize.width != 0);
    XCTAssertNotNil(item.cellModel);
    
}

@end
