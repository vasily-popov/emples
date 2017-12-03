//
//  BaseRouter+Test.m
//  emplesMVCTests
//
//  Created by Vasily Popov on 11/29/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

#import <Specta/Specta.h>
#import <Expecta/Expecta.h>
#import "BaseRouter.h"

SpecBegin(BaseRouter)

describe(@"BaseRouter_init", ^{
    
    __block BaseRouter *router = nil;
    beforeAll(^{
        router = [[BaseRouter alloc] init];
    });
    
    it(@"should be exist", ^{
        expect(router).notTo.beNil();
        expect(router.window).to.beNil();
        expect(router.viewController).to.beNil();
    });
    
    it(@"should handle invalid inputs", ^{
        expect(^{
            [router prepareForSegue:nil sender:nil];
            [router setRootViewController:nil];
            [router popViewControllerAnimated:NO];
            [router popToRootViewControllerAnimated:NO];
            [router dismissViewControllerAnimated:NO completion:nil];
            [router showAlertWithTitle:nil message:nil];
        }).notTo.raiseAny();
    });
    
    afterAll(^{
        router = nil;
    });
});

describe(@"BaseRouter init with window and navigation vc", ^{
    
    __block UINavigationController *vc = nil;
    __block UIWindow *window = nil;
    __block BaseRouter *router = nil;
    beforeAll(^{
        vc = [UINavigationController new];
        window = [UIWindow new];
        router = [[BaseRouter alloc] initWithNavigationVC:vc andWindow:window];
    });
    
    it(@"should not rise any exception", ^{
        expect(^{
            [router prepareForSegue:nil sender:nil];
            [router setRootViewController:nil];
            [router popViewControllerAnimated:NO];
            [router popToRootViewControllerAnimated:NO];
            [router dismissViewControllerAnimated:NO completion:nil];
            [router showAlertWithTitle:nil message:nil];
        }).notTo.raiseAny();
    });
    
    afterAll(^{
        vc = nil;
        window = nil;
        router = nil;
    });
});

SpecEnd

