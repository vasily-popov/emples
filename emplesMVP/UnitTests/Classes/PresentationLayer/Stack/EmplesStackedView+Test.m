//
//  EmplesStackedView+Test.m
//  emplesMVCTests
//
//  Created by Vasily Popov on 11/29/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>
#import "EmplesStackedView.h"
#import "EmplesStackedViewManager.h"
#import "EmplesListModelDecorator.h"
#import "DataSourceItem.h"
#import <ZLSwipeableView/ZLSwipeableView.h>

@interface EmplesStackedView(Test)

@property (strong, nonatomic, readonly) ZLSwipeableView *swipeableView;
@property (strong, nonatomic, readonly) EmplesStackedViewManager *sourceManager;

@end

@interface EmplesStackedView_Test : XCTestCase

@end

@implementation EmplesStackedView_Test

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testStackView {
    EmplesStackedView *view = [EmplesStackedView new];
    XCTAssertNotNil(view);
    UINavigationController *vc = [[UINavigationController alloc] initWithRootViewController:view];
    XCTAssertNotNil(vc);
    XCTAssertNoThrow([view viewDidLoad]);
    XCTAssertNotNil(view.swipeableView);
    XCTAssertNotNil(view.sourceManager);
    XCTAssertNotNil(view.swipeableView.viewAnimator);
    XCTAssertNoThrow([view showProgressView]);
    id mockSource = OCMClassMock([DataSourceItem class]);
    NSArray *array = @[mockSource];
    XCTAssertNoThrow([view updateCollectionItems:array]);
    XCTAssertNoThrow([view updateCollectionItems:nil]);
    XCTAssertNoThrow([view hideProgressView]);
    XCTAssertNoThrow([view didReceiveMemoryWarning]);
}
@end
