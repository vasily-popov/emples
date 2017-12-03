//
//  EmplesGalleryView+Test.m
//  emplesMVCTests
//
//  Created by Vasily Popov on 11/29/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

#import <Specta/Specta.h>
#import <Expecta/Expecta.h>
#import <OCMock/OCMock.h>
#import "EmplesGalleryView.h"
#import "EmplesGridCollectionViewManager.h"
#import "EmplesCollectionPresenter.h"


@interface EmplesGalleryView(Test)
    
@property (strong, nonatomic, readonly) UICollectionView *collection;
@property (strong, nonatomic, readonly) EmplesGridCollectionViewManager *sourceManager;
    
@end


SpecBegin(EmplesGalleryView)


describe(@"EmplesGalleryView", ^{
    
    __block EmplesGalleryView *view = nil;
    __block id mock = nil;
    beforeEach(^{
        mock = OCMClassMock([EmplesCollectionPresenter class]);
        view = [EmplesGalleryView new];
        expect(view).notTo.beNil();
        view.presenter = mock;
        UINavigationController *vc = [[UINavigationController alloc] initWithRootViewController:view];
        expect(vc).notTo.beNil();
    });
    
    it(@"should call viewDidload", ^{
        expect(^{
            [view viewDidLoad];
        }).notTo.raiseAny();
        expect(view.collection).toNot.beNil();
        expect(view.sourceManager).toNot.beNil();
        OCMVerify([mock viewDidLoad]);
    });
    
    it(@"should reload collection", ^{
        expect(^{
            [view viewDidLoad];
            [view showProgressView];
            [view updateCollectionItems:@[@1,@3]];
            [view hideProgressView];
        }).notTo.raiseAny();
        OCMVerify([view.collection reloadData]);
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
        mock = nil;
        view = nil;
    });
});

SpecEnd

