//
//  EmplesDetailTextViewWithImageViewCell+Test.m
//  emplesMVCTests
//
//  Created by Vasily Popov on 11/29/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

#import <Specta/Specta.h>
#import <Expecta/Expecta.h>
#import <OCMock/OCMock.h>
#import "EmplesDetailTextViewWithImageViewCell.h"
#import "EmplesDetailDescriptionCellModel.h"

SpecBegin(EmplesDetailTextViewWithImageViewCell)

describe(@"EmplesDetailTextViewWithImageViewCell", ^{
    
    __block EmplesDetailTextViewWithImageViewCell *cell = nil;
    beforeEach(^{
        cell = [[EmplesDetailTextViewWithImageViewCell alloc] init];
        expect(cell).toNot.beNil();
    });
    
    it(@"should configure", ^{
        expect(^{
            id mock = OCMClassMock([EmplesDetailDescriptionCellModel class]);
            OCMStub([mock imageURL]).andReturn(@"/test/");
            [cell configureWithModel:mock];
        }).notTo.raiseAny();
    });
    
    afterEach(^{
        cell = nil;
    });
});

SpecEnd

