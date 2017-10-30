//
//  UIColor+Hex.h
//  emplesMVC
//
//  Created by Vasily Popov on 10/28/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Hex)

+ (UIColor *)colorWithRGBHex:(unsigned)RGBHex alpha:(CGFloat)alphaValue;
+ (UIColor *)colorWithRGBHex:(unsigned)RGBHex; //0xFFAABB
+ (UIColor *)colorFromHexString:(NSString *)hexString;//#AABBCC

@end
