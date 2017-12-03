//
//  EmplesDetailDescriptionCellModel+Test.m
//  emplesMVCTests
//
//  Created by Vasily Popov on 11/29/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

#import <Specta/Specta.h>
#import <Expecta/Expecta.h>
#import "EmplesDetailDescriptionCellModel.h"

SpecBegin(EmplesDetailDescriptionCellModel)

describe(@"EmplesDetailDescriptionCellModel", ^{
    
    __block EmplesDetailDescriptionCellModel *model = nil;
    beforeEach(^{
        model = [EmplesDetailDescriptionCellModel new];
        expect(model).toNot.beNil();
        
    });
    
    it(@"should have model value", ^{
        model.descriptionText = @"test";
        expect([model getModelValue]).to.equal(@"test");
        
    });
    
    it(@"should have cell class name", ^{
        expect([model cellClassName]).to.equal(@"EmplesDetailTextViewWithImageViewCell");
    });
    
    afterEach(^{
        model = nil;
    });
});

SpecEnd

