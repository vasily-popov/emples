//
//  EmplesCarouselViewManager+Test.m
//  emplesMVCTests
//
//  Created by Vasily Popov on 11/29/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

#import <OCMock/OCMock.h>
#import <Specta/Specta.h>
#import <Expecta/Expecta.h>
#import "EmplesCarouselViewManager.h"

@interface EmplesCarouselViewManager (Test)
    
@property (nonatomic, strong, readonly) NSArray *dataSource;
    
@end

SpecBegin(EmplesCarouselViewManager)

describe(@"EmplesCarouselViewManager", ^{
    
    context(@"should be created without source", ^{
        __block EmplesCarouselViewManager *manager;
        
        beforeEach(^{
            manager = [[EmplesCarouselViewManager alloc] init];
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
            
            id mock = OCMClassMock([iCarousel class]);
            id dataSource = [manager dataSourceForCarouselView:mock];
            id delegate = [manager delegateForCarouselView:mock];
            expect(dataSource).toNot.beNil();
            expect(delegate).toNot.beNil();
            
            expect(dataSource).conformTo(@protocol(iCarouselDataSource));
            expect(delegate).conformTo(@protocol(iCarouselDelegate));
            
        });
        
        afterAll(^{
            manager = nil;
        });
    });
    
    
    context(@"should be created with source", ^{
        __block EmplesCarouselViewManager *manager;
        
        beforeEach(^{
            manager = [[EmplesCarouselViewManager alloc] initWithSource:@[@9, @8]];
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
            id mock = OCMClassMock([iCarousel class]);
            id dataSource = [manager dataSourceForCarouselView:mock];
            id delegate = [manager delegateForCarouselView:mock];
            
            expect(dataSource).toNot.beNil();
            expect(delegate).toNot.beNil();
            
            expect(dataSource).conformTo(@protocol(iCarouselDataSource));
            expect(delegate).conformTo(@protocol(iCarouselDelegate));
            
        });
        
        afterAll(^{
            manager = nil;
        });
    });
});

SpecEnd

