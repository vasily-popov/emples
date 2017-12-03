//
//  EmplesGridPresenter+Test.m
//  emplesMVPTests
//
//  Created by Vasily Popov on 11/29/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

#import <Specta/Specta.h>
#import <Expecta/Expecta.h>
#import <OCMock/OCMock.h>
#import "EmplesGridPresenter.h"
#import "EmplesRecreationArea.h"

SpecBegin(EmplesGridPresenter)

describe(@"EmplesGridPresenter", ^{
    
    __block EmplesGridPresenter *presenter = nil;
    beforeEach(^{
        presenter = [[EmplesGridPresenter alloc] init];
        expect(presenter).notTo.beNil();
    });
    
    it(@"should preapre item", ^{
        expect(^{
            id mock = OCMClassMock([EmplesRecreationArea class]);
            expect([presenter prepareCollectionArrayFromArray:@[mock]]).to.haveCount(1);
        }).notTo.raiseAny();
    });
    
    afterEach(^{
        presenter = nil;
    });
});

SpecEnd

