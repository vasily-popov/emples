//
//  EmplesMenuModel+Test.m
//  emplesMVCTests
//
//  Created by Vasily Popov on 11/29/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

#import <Specta/Specta.h>
#import <Expecta/Expecta.h>
#import "EmplesMenuModel.h"


SpecBegin(EmplesMenuModel)

describe(@"EmplesMenuModel", ^{
    
    __block EmplesMenuModel *model = nil;
    beforeEach(^{
        model = [EmplesMenuModel new];
    });
    
    it(@"should be exist and have 5 elements", ^{
        expect(model).notTo.beNil();
    });
    
    it(@"should be exist and have 5 elements", ^{
        expect([model buildSourceModel]).to.haveCount(5);
    });
    
    afterAll(^{
        model = nil;
    });
});

SpecEnd

