//
//  DataGridSourceItem+Test.m
//  emplesMVCTests
//
//  Created by Vasily Popov on 11/28/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

#import "DataGridSourceItem.h"
#import <OCMock/OCMock.h>
#import <Specta/Specta.h>
#import <Expecta/Expecta.h>

SpecBegin(DataGridSourceItem)

describe(@"DataGridSourceItem", ^{
    
    it(@"should be created with empty value and model", ^{
        DataGridSourceItem *item = [[DataGridSourceItem alloc] initWithCellModel:nil];
        expect(item).notTo.beNil();
        expect(item.value).to.beNil();
        expect(item.cellModel).to.beNil();
    });
    
    it(@"should be created with valid value and model", ^{
        id mockProtocol = OCMProtocolMock(@protocol(ViewCellModelProtocol));
        OCMStub([mockProtocol getModelValue]).andReturn(@"test");
        DataGridSourceItem *item = [[DataGridSourceItem alloc] initWithCellModel:mockProtocol];
        expect(item).notTo.beNil();
        expect(item.value).notTo.beNil();
        expect(item.value).to.equal(@"test");
        expect(item.cellModel).notTo.beNil();
    });

});

SpecEnd
