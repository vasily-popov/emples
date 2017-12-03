//
//  NSString+LocalizableTest.m
//  emplesMVCTests
//
//  Created by Vasily Popov on 11/28/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

#import "NSString+Localizable.h"
#import <Specta/Specta.h>
#import <Expecta/Expecta.h>

SpecBegin(Localizable)

describe(@"Localizable", ^{
    
    beforeAll(^{
    });
    
    it(@"should not change string if is not localized", ^{
        NSString *localizedString = [@"test" localizedString];
        expect(localizedString).notTo.beNil();
        expect(localizedString).to.equal(@"test");
    });
    
    it(@"should localize existing string", ^{
        NSString *localizedString = [@"kFileNotFoundString" localizedString];
        expect(localizedString).notTo.beNil();
        expect(localizedString).to.equal(@"File not found");
    });
    
    it(@"should not throw exception when localize empty string", ^{
        expect(^{
            NSString *localizedString = [@"" localizedString];
            expect(localizedString).notTo.beNil();
        }).notTo.raiseAny();
    });
    
    it(@"should return nil for nil string", ^{
        
        NSString *test = nil;
        NSString *nilString = [test localizedString];
        expect(nilString).to.beNil();
    });
    
    afterAll(^{
    });
});

SpecEnd

