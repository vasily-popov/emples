//
//  NSString+LocalizableTest.m
//  emplesMVCTests
//
//  Created by Vasily Popov on 11/28/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NSString+Localizable.h"

@interface NSString_LocalizableTest : XCTestCase

@end

@implementation NSString_LocalizableTest

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testLocalizedString {
    
    NSString *localizedString = [@"test" localizedString];
    XCTAssertNotNil(localizedString);
    XCTAssertEqual(localizedString, @"test");
    
    NSString *emptyString = [@"" localizedString];
    XCTAssertNotNil(emptyString);
    
    NSString *test = nil;
    NSString *nilString = [test localizedString];
    XCTAssertNil(nilString);
}

@end
