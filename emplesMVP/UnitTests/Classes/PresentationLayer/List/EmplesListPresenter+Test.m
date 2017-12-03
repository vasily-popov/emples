//
//  EmplesListPresenter+Test.m
//  emplesMVPTests
//
//  Created by Vasily Popov on 11/29/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

#import <Specta/Specta.h>
#import <Expecta/Expecta.h>
#import <OCMock/OCMock.h>
#import "EmplesListPresenter.h"
#import "EmplesListModelDecorator.h"

@interface EmplesListPresenter (Test)
    
@property (nonatomic, strong) EmplesListModelDecorator *decorator;
    
-(NSArray*) prepareCollectionArray;
    
@end

SpecBegin(EmplesListPresenter)


describe(@"EmplesListPresenter", ^{
    
    __block EmplesListPresenter *presenter = nil;
    __block id mock = nil;
    beforeEach(^{
        mock = OCMClassMock([EmplesAreasModel class]);
        presenter = [[EmplesListPresenter alloc] initWithModel:mock];
        expect(presenter).notTo.beNil();
        expect(presenter.decorator).notTo.beNil();
    });
    
    it(@"should not crash", ^{
        expect(^{
            [presenter prepareCollectionArray];
        }).notTo.raiseAny();
    });
    
    afterEach(^{
        [mock stopMocking];
        mock = nil;
        presenter = nil;
    });
});

SpecEnd

