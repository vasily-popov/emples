//
//  EmplesListPresenter+Test.m
//  emplesMVPTests
//
//  Created by Vasily Popov on 11/29/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>
#import "EmplesListPresenter.h"
#import "EmplesListModelDecorator.h"

@interface EmplesListPresenter (Test)

@property (nonatomic, strong) EmplesListModelDecorator *decorator;

-(NSArray*) prepareCollectionArray;

@end

@interface EmplesListPresenter_Test : XCTestCase

@end

@implementation EmplesListPresenter_Test

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testListPresenter {
    id modelMock = OCMClassMock([EmplesAreasModel class]);
    EmplesListPresenter *presenter = [[EmplesListPresenter alloc] initWithModel:modelMock];
    XCTAssertNotNil(presenter);
    XCTAssertNotNil(presenter.decorator);
    XCTAssertNoThrow([presenter prepareCollectionArray]);
}

@end
