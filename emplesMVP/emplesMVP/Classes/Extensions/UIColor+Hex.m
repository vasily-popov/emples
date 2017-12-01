//
//  UIColor+Hex.m
//  emplesMVC
//
//  Created by Vasily Popov on 10/28/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

#import "UIColor+Hex.h"

@implementation UIColor (Hex)

+ (UIColor *)colorWithRGBHex:(unsigned)RGBHex alpha:(CGFloat)alphaValue
{
    return [UIColor colorWithRed:((float)((RGBHex & 0xFF0000) >> 16)) / 255.0
                           green:((float)((RGBHex & 0xFF00) >> 8)) / 255.0
                            blue:((float)(RGBHex & 0xFF)) / 255.0
                           alpha:alphaValue];
}

+ (UIColor *)colorWithRGBHex:(unsigned)RGBHex
{
    return [self colorWithRGBHex:RGBHex alpha:1.0];
}

+ (UIColor *)colorFromHexString:(NSString *)hexString
{
    if (hexString)
    {
        unsigned rgbValue = 0;
        NSScanner *scanner = [NSScanner scannerWithString:hexString];
        if ([hexString hasPrefix:@"#"])
        {
            [scanner setScanLocation:1];
        }
        BOOL successed = [scanner scanHexInt:&rgbValue];
        if (successed) {
            return [UIColor colorWithRGBHex:rgbValue];
        }
    }
    return nil;
}
@end



