//
//  EmplesCollectionController+Test.m
//  emplesMVCTests
//
//  Created by Vasily Popov on 11/29/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>
#import "EmplesCollectionPresenter.h"
#import "EmplesAreasModel.h"

@interface EmplesCollectionPresenter()

@property (nonatomic, strong, readonly) EmplesAreasModel *model;

-(void)areasModel:(EmplesAreasModel*)model didFinishWithResponse:(id)response;
-(void)areasModel:(EmplesAreasModel*)model didFinishWithError:(NSError*)error;
-(void)selectedItem:(EmplesRecAreaJSONModel*)item;

@end

@interface EmplesCollectionPresenter_Test : XCTestCase

@end

@implementation EmplesCollectionPresenter_Test

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
    id routerMock = OCMClassMock([EmplesItemRouter class]);
    id viewMock = OCMProtocolMock(@protocol(EmplesCollectionViewProtocol));
    EmplesCollectionPresenter * presenter = [[EmplesCollectionPresenter alloc] initWithModel:modelMock];
    XCTAssertNotNil(presenter);
    XCTAssertNotNil(presenter.model);
    presenter.view = viewMock;
    presenter.router = routerMock;
    XCTAssertNoThrow([presenter viewDidLoad]);
    OCMVerify([modelMock fetchAreas]);
    XCTAssertNil([presenter prepareCollectionArray]);
    XCTAssertNoThrow([presenter areasModel:modelMock didFinishWithError:nil]);
    XCTAssertNoThrow([presenter areasModel:modelMock didFinishWithResponse:nil]);
    XCTAssertNoThrow([presenter selectedItem:nil]);
}

@end
