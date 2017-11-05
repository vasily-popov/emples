//
//  UIView+Reusable.m
//  emplesMVC
//
//  Created by Vasily Popov on 10/28/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

#import "UIView+Reusable.h"

@implementation UIView (Reusable)

+(NSString*)defaultReuseIdentifier
{
    return NSStringFromClass([self class]);
}

+(NSString*)nibName
{
    return NSStringFromClass([self class]);
}

@end
