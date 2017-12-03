//
//  GenericTableViewSource+Test.m
//  emplesMVCTests
//
//  Created by Vasily Popov on 11/29/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

#import <OCMock/OCMock.h>
#import <Specta/Specta.h>
#import <Expecta/Expecta.h>
#import "GenericTableViewSource.h"

SpecBegin(GenericTableViewSource)

describe(@"GenericTableViewSource", ^{
    
    context(@"should be created without source", ^{
        __block GenericTableViewSource *dataSource;
        
        beforeEach(^{
            dataSource = [[GenericTableViewSource alloc] init];
            expect(dataSource).notTo.beNil();
            expect(dataSource.source).to.beNil();
        });
        
        it(@"should append items", ^{
            [dataSource appendItems:@[@1,@2,@3]];
            expect(dataSource.source).to.haveCount(3);
        });
        
        it(@"should set source", ^{
            [dataSource setDataSource:@[@1]];
            expect(dataSource.source).to.haveCount(1);
        });
        
        afterAll(^{
            dataSource = nil;
        });
    });
    
    context(@"should be created with source", ^{
        __block GenericTableViewSource *dataSource;
        
        beforeEach(^{
            dataSource = [[GenericTableViewSource alloc] initWithSource:@[@9, @8]];
            expect(dataSource).notTo.beNil();
            expect(dataSource.source).to.haveCount(2);
        });
        
        it(@"should append items", ^{
            [dataSource appendItems:@[@1,@2,@3]];
            expect(dataSource.source).to.haveCount(5);
        });
        
        it(@"should set source", ^{
            [dataSource setDataSource:@[@1]];
            expect(dataSource.source).to.haveCount(1);
        });
        
        afterAll(^{
            dataSource = nil;
        });
    });
});

SpecEnd

