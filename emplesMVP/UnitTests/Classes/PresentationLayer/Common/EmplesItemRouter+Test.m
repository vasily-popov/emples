//
//  EmplesItemRouter+Test.m
//  emplesMVCTests
//
//  Created by Vasily Popov on 11/29/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

#import <Specta/Specta.h>
#import <Expecta/Expecta.h>
#import <OCMock/OCMock.h>
#import "EmplesItemRouter.h"
#import "EmplesRecAreaJSONModel.h"

SpecBegin(EmplesItemRouter)

describe(@"EmplesItemRouter", ^{
    
    __block EmplesItemRouter *router = nil;
    __block UINavigationController *vc = nil;
    __block UIWindow *window = nil;
    beforeAll(^{
        vc = [UINavigationController new];
        window = [UIWindow new];
        router = [[EmplesItemRouter alloc] initWithNavigationVC:vc andWindow:window];
    });
    
    it(@"should be exist", ^{
        expect(router).notTo.beNil();
        expect(router.window).to.equal(window);
        expect(router.viewController).to.equal(vc);
    });
    
    it(@"should navigate to detail", ^{
        id mock = OCMClassMock([EmplesRecAreaJSONModel class]);
        expect(^{
            [router navigateToItemDetail:mock];
        }).notTo.raiseAny();
        [mock stopMocking];
    });
    
    afterAll(^{
        window = nil;
        vc = nil;
        router = nil;
    });
});

SpecEnd
