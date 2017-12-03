//
//  EmplesMenuCellModel+Test.m
//  emplesMVCTests
//
//  Created by Vasily Popov on 11/29/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

#import <Specta/Specta.h>
#import <Expecta/Expecta.h>
#import "EmplesMenuCellModel.h"

SpecBegin(EmplesMenuCellModel)

describe(@"EmplesMenuCellModel", ^{
    
    __block EmplesMenuCellModel *model = nil;
    beforeEach(^{
        model = [EmplesMenuCellModel new];
        expect(model).toNot.beNil();
        
    });
    
    it(@"should have model value", ^{
        model.text = @"test";
        expect([model getModelValue]).to.equal(@"test");
        
    });
    
    it(@"should have cell class name", ^{
        expect([model cellClassName]).to.equal(@"EmplesMenuViewCell");
    });
    
    afterEach(^{
        model = nil;
    });
});

SpecEnd

