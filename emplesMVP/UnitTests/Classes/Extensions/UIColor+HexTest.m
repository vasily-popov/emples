//
//  UIColor+HexTest.m
//  emplesMVCTests
//
//  Created by Vasily Popov on 11/28/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "UIColor+Hex.h"

@interface UIColor_HexTest : XCTestCase

@end

@implementation UIColor_HexTest

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testColorNotNil {
    
    UIColor *color = [UIColor colorWithRGBHex:0xFFFFFF];
    XCTAssertNotNil(color);
    
    UIColor *colorWithAlfa = [UIColor colorWithRGBHex:0xFFFFFF alpha:.4];
    XCTAssertNotNil(colorWithAlfa);
}

- (void)testColorFromHexStringValidValueNotNil {
    UIColor *color = [UIColor colorFromHexString:@"#AABBCC"];
    XCTAssertNotNil(color);
}

- (void)testColorFromHexStringInvalidValue {
    UIColor *emptyContent = [UIColor colorFromHexString:@"#"];
    XCTAssertNil(emptyContent);
    
    UIColor *emtyString = [UIColor colorFromHexString:@""];
    XCTAssertNil(emtyString);
    
    UIColor *nilString = [UIColor colorFromHexString:nil];
    XCTAssertNil(nilString);
}

- (void)testColorFromHexStringValidValueWithHashChar {
    UIColor *color = [UIColor colorFromHexString:@"AABBCC"];
    XCTAssertNotNil(color);
}

@end
