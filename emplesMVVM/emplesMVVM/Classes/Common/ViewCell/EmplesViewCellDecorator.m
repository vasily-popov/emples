//
//  EmplesViewCellDecorator.m
//  emplesVIPER
//
//  Created by Vasily Popov on 11/3/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

#import "EmplesViewCellDecorator.h"

@implementation EmplesViewCellDecorator

-(instancetype) initWithObject:(NSObject<ViewCellModelProtocol> *)object
{
    _instance = object;
    return self;
}

+(instancetype) decoratedInstanceOf:(NSObject<ViewCellModelProtocol> *)instance
{
    return [[self alloc] initWithObject:instance];
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)selector
{
    return [self.instance methodSignatureForSelector:selector];
}

- (void)forwardInvocation:(NSInvocation *)invocation
{
    [invocation invokeWithTarget:self.instance];
}

@end
