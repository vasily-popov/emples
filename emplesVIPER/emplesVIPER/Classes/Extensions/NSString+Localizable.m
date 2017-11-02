//
//  NSString+Localizable.m
//  emplesMVC
//
//  Created by Vasily Popov on 10/28/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

#import "NSString+Localizable.h"

@implementation NSString (Localizable)

-(NSString *)localizedString
{
    return [[NSBundle mainBundle] localizedStringForKey:self value:nil table:nil];
    
}

@end
