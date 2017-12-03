//
//  EmplesDetailDirectionTextViewCell+Test.m
//  emplesMVCTests
//
//  Created by Vasily Popov on 11/29/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

#import <Specta/Specta.h>
#import <Expecta/Expecta.h>
#import <OCMock/OCMock.h>
#import "EmplesDetailDirectionTextViewCell.h"
#import "EmplesDetailDirectionsCellModel.h"

SpecBegin(EmplesDetailDirectionTextViewCell)

describe(@"EmplesDetailDirectionTextViewCell", ^{
    
    __block EmplesDetailDirectionTextViewCell *cell = nil;
    beforeEach(^{
        cell = [[EmplesDetailDirectionTextViewCell alloc] init];
        expect(cell).toNot.beNil();
    });
    
    it(@"should configure", ^{
        expect(^{
            id mock = OCMClassMock([EmplesDetailDirectionsCellModel class]);
            [cell configureWithModel:mock];
        }).notTo.raiseAny();
    });
    
    afterEach(^{
        cell = nil;
    });
});

SpecEnd

