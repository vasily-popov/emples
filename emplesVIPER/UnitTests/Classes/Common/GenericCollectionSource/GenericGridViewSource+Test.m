//
//  GenericGridViewSource+Test.m
//  emplesMVCTests
//
//  Created by Vasily Popov on 11/28/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//


#import "GenericGridViewSource.h"
#import <Specta/Specta.h>
#import <Expecta/Expecta.h>

SpecBegin(GenericGridViewSource)

describe(@"GenericGridViewSource", ^{
    
    context(@"should be created without source", ^{
        __block GenericGridViewSource *gridSource;
        
        beforeAll(^{
            gridSource = [[GenericGridViewSource alloc] init];
            expect(gridSource).notTo.beNil();
            expect(gridSource.source).to.beNil();
        });
        
        it(@"should append items", ^{
            [gridSource appendItems:@[@1,@2,@3]];
            expect(gridSource.source).to.haveCount(3);
        });
        
        it(@"should set source", ^{
            [gridSource setDataSource:@[@1]];
            expect(gridSource.source).to.haveCount(1);
        });
        
        afterAll(^{
            gridSource = nil;
        });
    });
    
    context(@"should be created with source1", ^{
        __block GenericGridViewSource *gridSource;
        
        beforeAll(^{
            gridSource = [[GenericGridViewSource alloc] initWithSource:@[@9, @8]];
            expect(gridSource).notTo.beNil();
            expect(gridSource.source).to.haveCount(2);
        });
        
        it(@"should append items", ^{
            [gridSource setDataSource:@[@1, @2]];
            [gridSource appendItems:@[@1,@2,@3]];
            expect(gridSource.source).to.haveCount(5);
        });
        
        it(@"should set source", ^{
            [gridSource setDataSource:@[@1]];
            expect(gridSource.source).to.haveCount(1);
        });
        
        afterAll(^{
            gridSource = nil;
        });
    });
});

SpecEnd

