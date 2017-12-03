//
//  EmplesMenuViewCell+Test.m
//  emplesMVCTests
//
//  Created by Vasily Popov on 11/29/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//


#import <Specta/Specta.h>
#import <Expecta/Expecta.h>
#import <OCMock/OCMock.h>
#import "EmplesMenuViewCell.h"
#import "EmplesMenuCellModel.h"

SpecBegin(EmplesMenuViewCell)

describe(@"EmplesMenuViewCell", ^{
    
    __block EmplesMenuViewCell *cell = nil;
    beforeEach(^{
        cell = [[EmplesMenuViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"resuse"];
        expect(cell).toNot.beNil();
    });
    
    it(@"should be loaded", ^{
        expect(^{
            [cell awakeFromNib];
        }).notTo.raiseAny();
    });
    
    it(@"should configure", ^{
        expect(^{
            id mock = OCMClassMock([EmplesMenuCellModel class]);
            [cell configureWithModel:mock];
        }).notTo.raiseAny();
    });
    
    afterEach(^{
        cell = nil;
    });
});

SpecEnd

