//
//  EmplesCarouselView+Test.m
//  emplesMVCTests
//
//  Created by Vasily Popov on 11/29/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>
#import "EmplesCarouselView.h"
#import "EmplesCarouselViewManager.h"
#import <iCarousel/iCarousel.h>

@interface EmplesCarouselView(Test)

@property (strong, nonatomic, readonly) iCarousel *carousel;
@property (strong, nonatomic, readonly) EmplesCarouselViewManager *sourceManager;

@end

@interface EmplesCarouselView_Test : XCTestCase

@end

@implementation EmplesCarouselView_Test

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testCarouselView {
    id modelMock = OCMClassMock([EmplesListModelDecorator class]);
    EmplesCarouselView *view = [EmplesCarouselView new];
    XCTAssertNotNil(view);
    UINavigationController *vc = [[UINavigationController alloc] initWithRootViewController:view];
    XCTAssertNotNil(vc);
    view.model = modelMock;
    XCTAssertNotNil(view.model);
    XCTAssertNoThrow([view viewDidLoad]);
    XCTAssertNotNil(view.carousel);
    XCTAssertNotNil(view.sourceManager);
    XCTAssertNoThrow([view showProgressView]);
    XCTAssertNoThrow([view showData]);
    XCTAssertNoThrow([view hideProgressView]);
    XCTAssertNoThrow([view didReceiveMemoryWarning]);
    
}

@end
