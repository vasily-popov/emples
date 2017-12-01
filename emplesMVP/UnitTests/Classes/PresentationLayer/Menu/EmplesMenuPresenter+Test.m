//
//  EmplesMenuController+Test.m
//  emplesMVCTests
//
//  Created by Vasily Popov on 11/29/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>
#import "EmplesAreasModel.h"
#import "EmplesMenuPresenter.h"

@interface EmplesMenuPresenter()

@property (nonatomic, strong, readonly) EmplesAreasModel *model;

-(void)selectedItem:(EnumMenuSelectedItem)item;
-(void)viewDidLoad;

@end

@interface EmplesMenuPresenter_Test : XCTestCase

@end

@implementation EmplesMenuPresenter_Test

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testInitWithModel {
    id modelMock = OCMClassMock([EmplesAreasModel class]);
    EmplesMenuPresenter * presenter = [[EmplesMenuPresenter alloc] initWithModel:modelMock];
    XCTAssertNotNil(presenter);
    XCTAssertNotNil(presenter.model);
    XCTAssertNoThrow([presenter viewDidLoad]);
}

- (void)testSelection {
    id modelMock = OCMClassMock([EmplesAreasModel class]);
    id mockRouter = OCMClassMock([EmplesMenuRouter class]);
    EmplesMenuPresenter * presenter = [[EmplesMenuPresenter alloc] initWithModel:modelMock];
    presenter.router = mockRouter;
    XCTAssertNotNil(presenter);
    XCTAssertNotNil(presenter.model);
    
    XCTAssertNoThrow([presenter selectedItem:EnumMenuSelectedItemList]);
    XCTAssertNoThrow([presenter selectedItem:EnumMenuSelectedItemGrid]);
    XCTAssertNoThrow([presenter selectedItem:EnumMenuSelectedItemCarousel]);
    XCTAssertNoThrow([presenter selectedItem:EnumMenuSelectedItemGallery]);
    XCTAssertNoThrow([presenter selectedItem:EnumMenuSelectedItemStack]);
    
}


@end
