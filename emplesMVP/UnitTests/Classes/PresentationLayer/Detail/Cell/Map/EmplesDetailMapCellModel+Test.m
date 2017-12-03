//
//  EmplesDetailMapCellModel+Test.m
//  emplesMVCTests
//
//  Created by Vasily Popov on 11/29/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

#import <Specta/Specta.h>
#import <Expecta/Expecta.h>
#import "EmplesDetailMapCellModel.h"

SpecBegin(EmplesDetailMapCellModel)

describe(@"EmplesDetailMapCellModel", ^{
    
    __block EmplesDetailMapCellModel *model = nil;
    beforeEach(^{
        model = [EmplesDetailMapCellModel new];
        expect(model).toNot.beNil();
    });
    
    it(@"should have nil model", ^{
        expect([model getModelValue]).to.beNil();
    });
    
    it(@"should have cell class name", ^{
        expect([model cellClassName]).to.equal(@"EmplesDeatilMapViewCell");
    });
    
    afterEach(^{
        model = nil;
    });
});

SpecEnd


