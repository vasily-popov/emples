//
//  UIColor+HexTest.m
//  emplesMVCTests
//
//  Created by Vasily Popov on 11/28/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

#import "UIColor+Hex.h"
#import <Specta/Specta.h>
#import <Expecta/Expecta.h>

SpecBegin(HexColor)

describe(@"HexColor", ^{
    
    it(@"should exist", ^{
        UIColor *color = [UIColor colorWithRGBHex:0xFFFFFF];
        expect(color).notTo.beNil();
    });
    
    it(@"should exist with alfa", ^{
        UIColor *color = [UIColor colorWithRGBHex:0xFFFFFF alpha:.4];
        expect(color).notTo.beNil();
    });
    
    it(@"should convert valid hex string to color", ^{
        UIColor *color = [UIColor colorFromHexString:@"#AABBCC"];
        expect(color).notTo.beNil();
    });
    
    it(@"should convert valid hex string (without #) to color", ^{
        UIColor *color = [UIColor colorFromHexString:@"AABBCC"];
        expect(color).notTo.beNil();
    });
    
    it(@"should not convert invalid hex string to color", ^{
        UIColor *color = [UIColor colorFromHexString:@"#"];
        expect(color).to.beNil();
        
        UIColor *color1 = [UIColor colorFromHexString:@""];
        expect(color1).to.beNil();
        
        UIColor *color2 = [UIColor colorFromHexString:nil];
        expect(color2).to.beNil();
    });
});

SpecEnd

