//
//  EmplesDetailDirectionsCellModel+Test.m
//  emplesMVCTests
//
//  Created by Vasily Popov on 11/29/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

#import <Specta/Specta.h>
#import <Expecta/Expecta.h>
#import "EmplesDetailDirectionsCellModel.h"

SpecBegin(EmplesDetailDirectionsCellModel)

describe(@"EmplesDetailDirectionsCellModel", ^{
    
    __block EmplesDetailDirectionsCellModel *model = nil;
    beforeEach(^{
        model = [EmplesDetailDirectionsCellModel new];
        expect(model).toNot.beNil();
        
    });
    
    it(@"should have model value", ^{
        model.directionText = @"test";
        expect([model getModelValue]).to.equal(@"test");
        
    });
    
    it(@"should have cell class name", ^{
        expect([model cellClassName]).to.equal(@"EmplesDetailDirectionTextViewCell");
    });
    
    afterEach(^{
        model = nil;
    });
});

SpecEnd


