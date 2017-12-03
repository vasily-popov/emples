//
//  EmplesMenuRouter+Router.m
//  emplesMVCTests
//
//  Created by Vasily Popov on 11/29/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

#import <Specta/Specta.h>
#import <Expecta/Expecta.h>
#import "EmplesMenuRouter.h"


SpecBegin(EmplesMenuRouter)

describe(@"EmplesMenuRouter", ^{
    
    __block UINavigationController *vc = nil;
    __block UIWindow *window = nil;
    __block EmplesMenuRouter *router = nil;
    beforeEach(^{
        vc = [UINavigationController new];
        window = [UIWindow new];
        router = [[EmplesMenuRouter alloc] initWithNavigationVC:vc andWindow:window];
    });
    
    it(@"should be exist", ^{
        expect(router).notTo.beNil();
        expect(router.window).to.equal(window);
        expect(router.viewController).to.equal(vc);
    });
    
    it(@"should not crash", ^{
        expect(^{
            [router navigateToSelectedItem:EnumMenuSelectedItemList];
        }).notTo.raiseAny();
    });
    
    afterAll(^{
        vc = nil;
        window = nil;
        router = nil;
    });
});

SpecEnd


