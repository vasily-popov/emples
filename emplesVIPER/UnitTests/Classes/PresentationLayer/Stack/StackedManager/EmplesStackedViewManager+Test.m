//
//  EmplesStackedViewManager+Test.m
//  emplesMVCTests
//
//  Created by Vasily Popov on 11/29/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

#import <OCMock/OCMock.h>
#import <Specta/Specta.h>
#import <Expecta/Expecta.h>
#import "EmplesStackedViewManager.h"

@interface EmplesStackedViewManager (Test)
    
@property (nonatomic, strong, readonly) NSArray *dataSource;
    
@end

SpecBegin(EmplesStackedViewManager)

describe(@"EmplesStackedViewManager", ^{
    
    context(@"should be created without source", ^{
        __block EmplesStackedViewManager *manager;
        
        beforeEach(^{
            manager = [[EmplesStackedViewManager alloc] init];
            expect(manager).notTo.beNil();
            expect(manager.dataSource).to.beNil();
        });
        
        it(@"should append items", ^{
            [manager appendItems:@[@1,@2,@3]];
            expect(manager.dataSource).to.haveCount(3);
        });
        
        it(@"should update source", ^{
            [manager updateDataSource:@[@1]];
            expect(manager.dataSource).to.haveCount(1);
        });
        
        it(@"should have datasource and delegate", ^{
            
            id mock = OCMClassMock([ZLSwipeableView class]);
            id dataSource = [manager dataSourceForStackedView:mock];
            id delegate = [manager delegateForStackedView:mock];
            expect(dataSource).toNot.beNil();
            expect(delegate).toNot.beNil();
            
            expect(dataSource).conformTo(@protocol(ZLSwipeableViewDataSource));
            expect(delegate).conformTo(@protocol(ZLSwipeableViewDelegate));
            
        });
        
        afterAll(^{
            manager = nil;
        });
    });
    
    
    context(@"should be created with source", ^{
        __block EmplesStackedViewManager *manager;
        
        beforeEach(^{
            manager = [[EmplesStackedViewManager alloc] initWithSource:@[@9, @8]];
            expect(manager).notTo.beNil();
            expect(manager.dataSource).notTo.beNil();
        });
        
        it(@"should append items", ^{
            [manager updateDataSource:@[@1, @2]];
            [manager appendItems:@[@1,@2,@3]];
            expect(manager.dataSource).to.haveCount(5);
        });
        
        it(@"should update source", ^{
            [manager updateDataSource:@[@1]];
            expect(manager.dataSource).to.haveCount(1);
        });
        
        it(@"should have datasource and delegate", ^{
            id mock = OCMClassMock([ZLSwipeableView class]);
            id dataSource = [manager dataSourceForStackedView:mock];
            id delegate = [manager delegateForStackedView:mock];
            
            expect(dataSource).toNot.beNil();
            expect(delegate).toNot.beNil();
            
            expect(dataSource).conformTo(@protocol(ZLSwipeableViewDataSource));
            expect(delegate).conformTo(@protocol(ZLSwipeableViewDelegate));
            
        });
        
        afterAll(^{
            manager = nil;
        });
    });
});

SpecEnd

