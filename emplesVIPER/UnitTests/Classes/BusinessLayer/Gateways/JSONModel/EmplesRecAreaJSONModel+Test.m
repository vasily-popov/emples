//
//  EmplesRecAreaJSONModel+Test.m
//  UnitTests
//
//  Created by Vasily Popov on 12/3/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

#import <Specta/Specta.h>
#import <Expecta/Expecta.h>
#import <OCMock/OCMock.h>
#import "EmplesRecAreaJSONModel.h"
#import "EmplesRecreationArea.h"

SpecBegin(EmplesRecAreaJSONModel)

describe(@"EmplesRecAreaJSONModel", ^{
    
    __block EmplesRecAreaJSONModel *model;
    beforeAll(^{
        model = [[EmplesRecAreaJSONModel alloc] init];
        expect(model).notTo.beNil();
    });
    
    it(@"should return ponso object", ^{
        expect([model ponsoObject]).to.beKindOf([EmplesRecreationArea class]);
    });
    
    afterAll(^{
        model = nil;
    });
});


SpecEnd
