//
//  EmplesProgressView+Test.m
//  emplesMVPTests
//
//  Created by Vasily Popov on 11/29/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

#import <Specta/Specta.h>
#import <Expecta/Expecta.h>
#import "EmplesProgressView.h"

SpecBegin(EmplesProgressView)

describe(@"EmplesProgressView", ^{
    
    __block EmplesProgressView *view = nil;
    beforeAll(^{
        view = [[EmplesProgressView alloc] initWithFrame:CGRectZero];
    });
    
    it(@"should be exist", ^{
        expect(view).notTo.beNil();
    });
    
    it(@"should be shown", ^{
        expect(^{[view show];}).notTo.raiseAny();
        expect(view.isHidden).notTo.beTruthy();
    });
    
    it(@"should be hidden", ^{
        expect(^{[view hide];}).notTo.raiseAny();
        expect(view.isHidden).to.beTruthy();
    });
    
    afterAll(^{
        view = nil;
    });
});

SpecEnd
