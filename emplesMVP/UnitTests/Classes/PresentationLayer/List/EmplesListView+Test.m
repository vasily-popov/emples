//
//  EmplesListView+Test.m
//  emplesMVCTests
//
//  Created by Vasily Popov on 11/29/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>
#import "EmplesListView.h"
#import "EmplesListTableViewManager.h"
#import "EmplesListModelDecorator.h"

@interface EmplesListView(Test)

@property (strong, nonatomic, readonly) UITableView *table;
@property (strong, nonatomic, readonly) EmplesListTableViewManager *sourceManager;

@end

@interface EmplesListView_Test : XCTestCase

@end

@implementation EmplesListView_Test

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testListView {
    EmplesListView *view = [EmplesListView new];
    XCTAssertNotNil(view);
    UINavigationController *vc = [[UINavigationController alloc] initWithRootViewController:view];
    XCTAssertNotNil(vc);
    XCTAssertNoThrow([view viewDidLoad]);
    XCTAssertNotNil(view.table);
    XCTAssertNotNil(view.sourceManager);
    XCTAssertNoThrow([view showProgressView]);
    NSArray *array = @[@1,@3];
    XCTAssertNoThrow([view updateCollectionItems:array]);
    XCTAssertNoThrow([view updateCollectionItems:nil]);
    XCTAssertNoThrow([view hideProgressView]);
    XCTAssertNoThrow([view didReceiveMemoryWarning]);
}

@end
