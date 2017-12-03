//
//  GenericTableViewManager+Test.m
//  emplesMVCTests
//
//  Created by Vasily Popov on 11/29/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

#import <OCMock/OCMock.h>
#import <Specta/Specta.h>
#import <Expecta/Expecta.h>
#import "GenericTableViewManager.h"
#import "GenericTableViewSource.h"

@interface GenericTableViewManager (Test)
    
@property (nonatomic, strong, readonly) GenericTableViewSource *dataSource;
    
@end

SpecBegin(GenericTableViewManager)

describe(@"GenericTableViewManager", ^{
    
    context(@"should be created without source", ^{
        __block GenericTableViewManager *manager;
        
        beforeEach(^{
            manager = [[GenericTableViewManager alloc] init];
            expect(manager).notTo.beNil();
            expect(manager.dataSource).to.beNil();
        });
        
        it(@"should append items", ^{
            [manager appendItems:@[@1,@2,@3]];
            expect(manager.dataSource.source).to.haveCount(3);
        });
        
        it(@"should update source", ^{
            [manager updateDataSource:@[@1]];
            expect(manager.dataSource.source).to.haveCount(1);
        });
        
        it(@"should have datasource and delegate", ^{
            id mock = OCMClassMock([UITableView class]);
            id dataSource = [manager dataSourceForTableView:mock];
            id delegate = [manager delegateForTableView:mock];
            
            expect(dataSource).toNot.beNil();
            expect(delegate).toNot.beNil();
            
            expect(dataSource).conformTo(@protocol(UITableViewDataSource));
            expect(delegate).conformTo(@protocol(UITableViewDelegate));
            
        });
        
        afterAll(^{
            manager = nil;
        });
    });
    
    
    context(@"should be created with source", ^{
        __block GenericTableViewManager *manager;
        
        beforeEach(^{
            manager = [[GenericTableViewManager alloc] initWithSource:@[@9, @8]];
            expect(manager).notTo.beNil();
            expect(manager.dataSource.source).notTo.beNil();
        });
        
        it(@"should append items", ^{
            [manager updateDataSource:@[@1, @2]];
            [manager appendItems:@[@1,@2,@3]];
            expect(manager.dataSource.source).to.haveCount(5);
        });
        
        it(@"should update source", ^{
            [manager updateDataSource:@[@1]];
            expect(manager.dataSource.source).to.haveCount(1);
        });
        
        it(@"should have datasource and delegate", ^{
            id mock = OCMClassMock([UITableView class]);
            id dataSource = [manager dataSourceForTableView:mock];
            id delegate = [manager delegateForTableView:mock];
            
            expect(dataSource).toNot.beNil();
            expect(delegate).toNot.beNil();
            
            expect(dataSource).conformTo(@protocol(UITableViewDataSource));
            expect(delegate).conformTo(@protocol(UITableViewDelegate));
            
        });
        
        afterAll(^{
            manager = nil;
        });
    });
});

SpecEnd

