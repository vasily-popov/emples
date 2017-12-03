//
//  EmplesGridViewCell+Test.m
//  emplesMVCTests
//
//  Created by Vasily Popov on 11/29/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

#import <Specta/Specta.h>
#import <Expecta/Expecta.h>
#import <OCMock/OCMock.h>
#import "EmplesGridViewCell.h"
#import "EmplesGridCellModel.h"

SpecBegin(EmplesGridViewCell)

describe(@"EmplesGridViewCell", ^{
    
    __block EmplesGridViewCell *cell = nil;
    beforeEach(^{
        cell = [[EmplesGridViewCell alloc] init];
        expect(cell).toNot.beNil();
    });
    
    it(@"should be loaded", ^{
        expect(^{
            [cell awakeFromNib];
        }).notTo.raiseAny();
    });
    
    it(@"should configure", ^{
        expect(^{
            id mock = OCMClassMock([EmplesGridCellModel class]);
            OCMStub([mock imageURL]).andReturn(@"/test/");
            [cell configureWithModel:mock];
        }).notTo.raiseAny();
    });
    
    afterEach(^{
        cell = nil;
    });
});

SpecEnd

