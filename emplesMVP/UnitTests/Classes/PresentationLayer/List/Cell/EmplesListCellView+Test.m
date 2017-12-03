//
//  EmplesListCellView+Test.m
//  emplesMVCTests
//
//  Created by Vasily Popov on 11/29/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

#import <Specta/Specta.h>
#import <Expecta/Expecta.h>
#import <OCMock/OCMock.h>
#import "EmplesListCellView.h"
#import "EmplesListCellModel.h"

SpecBegin(EmplesListCellView)

describe(@"EmplesListCellView", ^{
    
    __block EmplesListCellView *cell = nil;
    beforeEach(^{
        cell = [[EmplesListCellView alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"resuse"];
        expect(cell).toNot.beNil();
    });
    
    it(@"should be loaded", ^{
        expect(^{
            [cell awakeFromNib];
        }).notTo.raiseAny();
    });
    
    it(@"should configure", ^{
        expect(^{
            id mock = OCMClassMock([EmplesListCellModel class]);
            [cell configureWithModel:mock];
        }).notTo.raiseAny();
    });
    
    afterEach(^{
        cell = nil;
    });
});

SpecEnd

