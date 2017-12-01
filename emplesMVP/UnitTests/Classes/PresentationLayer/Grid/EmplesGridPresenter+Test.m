//
//  EmplesGridPresenter+Test.m
//  emplesMVPTests
//
//  Created by Vasily Popov on 11/29/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>
#import "EmplesGridPresenter.h"
#import "EmplesGridModelDecorator.h"

@interface EmplesGridPresenter (Test)

@property (nonatomic, strong) EmplesGridModelDecorator *decorator;

-(NSArray*) prepareCollectionArray;

@end

@interface EmplesGridPresenter_Test : XCTestCase

@end

@implementation EmplesGridPresenter_Test

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testGridPresenter {
    id modelMock = OCMClassMock([EmplesAreasModel class]);
    EmplesGridPresenter *presenter = [[EmplesGridPresenter alloc] initWithModel:modelMock];
    XCTAssertNotNil(presenter);
    XCTAssertNotNil(presenter.decorator);
    XCTAssertNoThrow([presenter prepareCollectionArray]);
}

@end
