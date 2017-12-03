//
//  DataSourceItem+Test.m
//  emplesMVCTests
//
//  Created by Vasily Popov on 11/29/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

#import "DataSourceItem.h"
#import <OCMock/OCMock.h>
#import <Specta/Specta.h>
#import <Expecta/Expecta.h>

SpecBegin(DataSourceItem)

describe(@"DataSourceItem", ^{
    
    it(@"should be created with empty value and model", ^{
        DataSourceItem *item = [[DataSourceItem alloc] initWithCellModel:nil];
        expect(item).notTo.beNil();
        expect(item.value).to.beNil();
        expect(item.cellModel).to.beNil();
    });
    
    it(@"should be created with valid value and model", ^{
        id mockProtocol = OCMProtocolMock(@protocol(ViewCellModelProtocol));
        OCMStub([mockProtocol getModelValue]).andReturn(@"test");
        DataSourceItem *item = [[DataSourceItem alloc] initWithCellModel:mockProtocol];
        expect(item).notTo.beNil();
        expect(item.value).notTo.beNil();
        expect(item.value).to.equal(@"test");
        expect(item.cellModel).notTo.beNil();
    });
    
});

SpecEnd

