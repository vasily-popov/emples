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
#import "EmplesMenuController.h"

@interface EmplesMenuController()

@property (nonatomic, strong, readonly) EmplesAreasModel *model;

-(void)selectedItem:(EnumMenuSelectedItem)item;

@end

@interface EmplesMenuController_Test : XCTestCase

@end

@implementation EmplesMenuController_Test

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
    EmplesMenuController * controller = [[EmplesMenuController alloc] initWithModel:modelMock];
    XCTAssertNotNil(controller);
    XCTAssertNotNil(controller.model);
}

- (void)testSelection {
    id modelMock = OCMClassMock([EmplesAreasModel class]);
    id mockRouter = OCMClassMock([EmplesMenuRouter class]);
    EmplesMenuController * controller = [[EmplesMenuController alloc] initWithModel:modelMock];
    controller.router = mockRouter;
    XCTAssertNotNil(controller);
    XCTAssertNotNil(controller.model);
    
    XCTAssertNoThrow([controller selectedItem:EnumMenuSelectedItemList]);
    XCTAssertNoThrow([controller selectedItem:EnumMenuSelectedItemGrid]);
    XCTAssertNoThrow([controller selectedItem:EnumMenuSelectedItemCarousel]);
    XCTAssertNoThrow([controller selectedItem:EnumMenuSelectedItemGallery]);
    XCTAssertNoThrow([controller selectedItem:EnumMenuSelectedItemStack]);
    
}


@end
