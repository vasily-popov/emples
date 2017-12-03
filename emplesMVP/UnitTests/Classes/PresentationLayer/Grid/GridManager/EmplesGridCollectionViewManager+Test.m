//
//  EmplesGridCollectionViewManager+Test.m
//  emplesMVCTests
//
//  Created by Vasily Popov on 11/29/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//
#import <OCMock/OCMock.h>
#import <Specta/Specta.h>
#import <Expecta/Expecta.h>
#import "EmplesGridCollectionViewManager.h"
#import "GenericGridViewSource.h"

@interface EmplesGridCollectionViewManager (Test)
    
@property (nonatomic, strong, readonly) GenericGridViewSource *dataSource;
    
@end

SpecBegin(EmplesGridCollectionViewManager)

describe(@"EmplesGridCollectionViewManager", ^{
    
    context(@"should be created without source", ^{
        __block EmplesGridCollectionViewManager *manager;
        
        beforeEach(^{
            manager = [[EmplesGridCollectionViewManager alloc] init];
            expect(manager).notTo.beNil();
            expect(manager.dataSource.source).to.beNil();
        });
        
        it(@"should append items", ^{
            [manager appendItems:@[@1,@2,@3]];
            expect(manager.dataSource.source).to.haveCount(3);
        });
        
        it(@"should set source", ^{
            [manager updateDataSource:@[@1]];
            expect(manager.dataSource.source).to.haveCount(1);
        });
        
        it(@"should have source and delegate", ^{
            id mock = OCMClassMock([UICollectionView class]);
            id dataSource = [manager dataSourceForCollectionView:mock];
            id delegate = [manager delegateForCollectionView:mock];
            expect(dataSource).notTo.beNil();
            expect(delegate).notTo.beNil();
            
            expect(dataSource).conformTo(@protocol(UICollectionViewDataSource));
            expect(delegate).conformTo(@protocol(UICollectionViewDelegate));
            
        });
        
        afterAll(^{
            manager = nil;
        });
    });
    
    context(@"should be created with source", ^{
        __block EmplesGridCollectionViewManager *manager;
        
        beforeEach(^{
            manager = [[EmplesGridCollectionViewManager alloc] initWithSource:@[@9, @8]];
            expect(manager).notTo.beNil();
            expect(manager.dataSource.source).to.haveCount(2);
        });
        
        it(@"should append items", ^{
            [manager appendItems:@[@1,@2,@3]];
            expect(manager.dataSource.source).to.haveCount(5);
        });
        
        it(@"should set source", ^{
            [manager updateDataSource:@[@1]];
            expect(manager.dataSource.source).to.haveCount(1);
        });
        
        it(@"should have source and delegate", ^{
            id mock = OCMClassMock([UICollectionView class]);
            id dataSource = [manager dataSourceForCollectionView:mock];
            id delegate = [manager delegateForCollectionView:mock];
            expect(dataSource).notTo.beNil();
            expect(delegate).notTo.beNil();
            
            expect(dataSource).conformTo(@protocol(UICollectionViewDataSource));
            expect(delegate).conformTo(@protocol(UICollectionViewDelegate));
            
        });
        
        afterAll(^{
            manager = nil;
        });
    });
});

SpecEnd

