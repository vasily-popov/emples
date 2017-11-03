//
//  EmplesProgressView.m
//  emplesMVC
//
//  Created by Vasily Popov on 10/29/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

#import "EmplesProgressView.h"
#import "UIColor+Hex.h"

@interface EmplesProgressView()

@property (strong, nonatomic) UIActivityIndicatorView *indicator;

@end

@implementation EmplesProgressView

- (void)dealloc
{
    
}

- (void)setHidden:(BOOL)hidden
{
    [super setHidden:hidden];
    
    if (hidden)
    {
        [self.indicator stopAnimating];
    }
    else
    {
        [self.indicator startAnimating];
    }
}

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self)
    {
        self.backgroundColor = [UIColor colorWithRGBHex:0x6F7179 alpha:0.5];
        self.indicator = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
        self.indicator.translatesAutoresizingMaskIntoConstraints = NO;
        [self addSubview:self.indicator];
        [self setHidden:YES];
        [self.indicator.centerYAnchor constraintEqualToAnchor:self.centerYAnchor constant:0].active = YES;
        [self.indicator.centerXAnchor constraintEqualToAnchor:self.centerXAnchor constant:0].active = YES;
    }
    return self;
}

- (void)show
{
    [self setHidden:NO];
}

- (void)hide
{
    [self setHidden:YES];
}


@end
