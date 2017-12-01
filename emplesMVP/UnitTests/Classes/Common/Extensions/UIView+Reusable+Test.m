//
//  UIView+Reusable+Test.m
//  emplesMVCTests
//
//  Created by Vasily Popov on 11/29/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>
#import "UIView+Reusable.h"
#import "UITableView+Reusable.h"
#import "UICollectionView+Reusable.h"

@interface UIView_Reusable_Test : XCTestCase

@end

@implementation UIView_Reusable_Test

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testUIView {
    NSString *viewResult = [UIView defaultReuseIdentifier];
    XCTAssertNotNil(viewResult);
    XCTAssert([viewResult isEqualToString:@"UIView"]);
    
    NSString *nibResult = [UIView nibName];
    XCTAssertNotNil(nibResult);
    XCTAssert([nibResult isEqualToString:@"UIView"]);
    
}

- (void)testUITableView {
    NSString *viewResult = [UITableView defaultReuseIdentifier];
    XCTAssertNotNil(viewResult);
    XCTAssert([viewResult isEqualToString:@"UITableView"]);
    
    NSString *nibResult = [UITableView nibName];
    XCTAssertNotNil(nibResult);
    XCTAssert([nibResult isEqualToString:@"UITableView"]);
    
    UITableView *table = [UITableView new];
    XCTAssertNoThrow([table registerCell:UITableViewCell.class]);
    XCTAssertNoThrow([table registerCellNib:UITableViewCell.class]);
    
}

- (void)testUICollectionView {
    NSString *viewResult = [UICollectionView defaultReuseIdentifier];
    XCTAssertNotNil(viewResult);
    XCTAssert([viewResult isEqualToString:@"UICollectionView"]);
    
    NSString *nibResult = [UICollectionView nibName];
    XCTAssertNotNil(nibResult);
    XCTAssert([nibResult isEqualToString:@"UICollectionView"]);
    
    id mock = OCMClassMock([UICollectionViewLayout class]);
    UICollectionView *collection = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:mock];
    XCTAssertNoThrow([collection registerCell:UICollectionViewCell.class]);
    XCTAssertNoThrow([collection registerCellNib:UICollectionViewCell.class]);
    
}

@end
