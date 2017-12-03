//
//  EmplesDetailMapViewCell+Test.m
//  UnitTests
//
//  Created by Vasily Popov on 12/3/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

#import <Specta/Specta.h>
#import <Expecta/Expecta.h>
#import <OCMock/OCMock.h>
#import "EmplesDetailMapViewCell.h"
#import "EmplesDetailMapCellModel.h"

SpecBegin(EmplesDetailMapViewCell)

describe(@"EmplesDetailMapViewCell", ^{
    
    __block EmplesDetailMapViewCell *cell = nil;
    beforeEach(^{
        cell = [[EmplesDetailMapViewCell alloc] init];
        expect(cell).toNot.beNil();
    });
    
    it(@"should configure", ^{
        expect(^{
            id mock = OCMClassMock([EmplesDetailMapCellModel class]);
            [cell configureWithModel:mock];
        }).notTo.raiseAny();
    });
    
    afterEach(^{
        cell = nil;
    });
});

SpecEnd
