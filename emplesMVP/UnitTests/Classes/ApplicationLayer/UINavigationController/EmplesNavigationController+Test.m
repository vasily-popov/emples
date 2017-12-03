//
//  EmplesNavigationController+Test.m
//  emplesMVCTests
//
//  Created by Vasily Popov on 11/28/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

#import <Specta/Specta.h>
#import <Expecta/Expecta.h>
#import "EmplesNavigationController.h"

SpecBegin(EmplesNavigationController)

describe(@"EmplesNavigationController", ^{
    
    __block EmplesNavigationController *vc = nil;
    beforeAll(^{
        vc = [[EmplesNavigationController alloc] init];
    });
    
    beforeEach(^{
    });
    
    
    it(@"exist", ^{
        expect(vc).notTo.beNil();
        expect(vc).to.beKindOf([UINavigationController class]);
        expect(vc.viewControllers).to.haveCount(0);
    });
    
    it(@"should allow to rotate", ^{
        expect([vc shouldAutorotate]).to.beTruthy();
    });
    
    it(@"should have root vc", ^{
        EmplesNavigationController *nvc = [[EmplesNavigationController alloc]
                                           initWithRootViewController:[UIViewController new]];
        expect(nvc).notTo.beNil();
        expect(nvc).to.beKindOf([UINavigationController class]);
        expect(nvc.viewControllers).to.haveCount(1);
    });
    
    afterEach(^{
    });
    
    afterAll(^{
        vc = nil;
    });
});

SpecEnd

