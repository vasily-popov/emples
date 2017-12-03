//
//  EmplesCarouselView+Test.m
//  emplesMVCTests
//
//  Created by Vasily Popov on 11/29/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

#import <Specta/Specta.h>
#import <Expecta/Expecta.h>
#import <OCMock/OCMock.h>
#import "EmplesCollectionPresenter.h"
#import "EmplesCarouselView.h"
#import "EmplesCarouselViewManager.h"
#import <iCarousel/iCarousel.h>


@interface EmplesCarouselView(Test)
    
@property (strong, nonatomic, readonly) iCarousel *carousel;
@property (strong, nonatomic, readonly) EmplesCarouselViewManager *sourceManager;
    
@end

SpecBegin(EmplesCarouselView)


describe(@"EmplesCarouselView", ^{
    
    __block EmplesCarouselView *view = nil;
    __block id mock = nil;
    beforeEach(^{
        mock = OCMClassMock([EmplesCollectionPresenter class]);
        view = [EmplesCarouselView new];
        expect(view).notTo.beNil();
        view.presenter = mock;
        UINavigationController *vc = [[UINavigationController alloc] initWithRootViewController:view];
        expect(vc).notTo.beNil();
    });
    
    it(@"should call viewDidload", ^{
        expect(^{
            [view viewDidLoad];
        }).notTo.raiseAny();
        expect(view.carousel).toNot.beNil();
        expect(view.sourceManager).toNot.beNil();
        OCMVerify([mock viewDidLoad]);
    });
    
    it(@"should reload carousel", ^{
        expect(^{
            [view viewDidLoad];
            [view showProgressView];
            [view updateCollectionItems:@[@1,@3]];
            [view hideProgressView];
        }).notTo.raiseAny();
        OCMVerify([view.carousel reloadData]);
    });
    
    it(@"should not crash", ^{
        expect(^{
            [view viewDidLoad];
            [view didReceiveMemoryWarning];
            [view showProgressView];
            [view updateCollectionItems:nil];
            [view hideProgressView];
        }).notTo.raiseAny();
    });
    
    afterEach(^{
        [mock stopMocking];
        mock = nil;
        view = nil;
    });
});

SpecEnd

