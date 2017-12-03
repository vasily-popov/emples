//
//  EmplesItemView+Test.m
//  emplesMVCTests
//
//  Created by Vasily Popov on 11/29/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

#import <Specta/Specta.h>
#import <Expecta/Expecta.h>
#import <OCMock/OCMock.h>
#import "EmplesItemView.h"
#import "EmplesListCellModel.h"


SpecBegin(EmplesItemView)


describe(@"EmplesItemView", ^{
    
    __block EmplesItemView *view = nil;
    __block id mock = nil;
    beforeEach(^{
        mock = OCMClassMock([EmplesListCellModel class]);
        view = [[EmplesItemView alloc] init];
        expect(view).toNot.beNil();
    });
    
    it(@"should be loaded", ^{
        expect(^{
            [view awakeFromNib];
        }).notTo.raiseAny();
    });
    
    it(@"should configure", ^{
        OCMStub([mock imageURL]).andReturn(@"/test/");
        expect(^{
            [view configureWithModel:mock];
        }).notTo.raiseAny();
    });
    
    afterEach(^{
        [mock stopMocking];
        mock = nil;
        view = nil;
    });
});

SpecEnd
