//
//  EmplesDetailView+Test.m
//  emplesMVCTests
//
//  Created by Vasily Popov on 11/29/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>
#import "EmplesDetailView.h"
#import "EmplesDetailTableViewManager.h"

@interface EmplesDetailView(Test)

@property (strong, nonatomic, readonly) UITableView *table;
@property (strong, nonatomic, readonly) EmplesDetailTableViewManager *sourceManager;

@end

@interface EmplesDetailView_Test : XCTestCase

@end

@implementation EmplesDetailView_Test

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testListView {
    id modelMock = OCMClassMock([EmplesDetailAreaModel class]);
    EmplesDetailView *view = [EmplesDetailView new];
    XCTAssertNotNil(view);
    UINavigationController *vc = [[UINavigationController alloc] initWithRootViewController:view];
    XCTAssertNotNil(vc);
    view.model = modelMock;
    XCTAssertNotNil(view.model);
    XCTAssertNoThrow([view viewDidLoad]);
    XCTAssertNotNil(view.table);
    XCTAssertNotNil(view.sourceManager);
}

@end
