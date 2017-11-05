//
//  EmplesUIBaseView.m
//  emplesMVVM
//
//  Created by Vasily Popov on 11/5/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

#import "EmplesUIBaseView.h"
#import "EmplesProgressView.h"

@interface EmplesUIBaseView()

@property (strong, nonatomic) EmplesProgressView *progressView;

@end

@implementation EmplesUIBaseView

-(void)setupConstraints
{
    self.progressView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.progressView.leftAnchor constraintEqualToAnchor:self.navigationController.view.leftAnchor constant:0].active = YES;
    [self.progressView.rightAnchor constraintEqualToAnchor:self.navigationController.view.rightAnchor constant:0].active = YES;
    [self.progressView.topAnchor constraintEqualToAnchor:self.navigationController.view.topAnchor constant:0].active = YES;
    [self.progressView.bottomAnchor constraintEqualToAnchor:self.navigationController.view.bottomAnchor constant:0].active = YES;
}

-(EmplesProgressView *)progressView
{
    if(!_progressView)
    {
        _progressView = [[EmplesProgressView alloc] initWithFrame:CGRectZero];
        [self.navigationController.view addSubview:_progressView];
        [self setupConstraints];
    }
    return _progressView;
}

-(void)showProgressView
{
    [self.progressView show];
}

-(void)hideProgressView
{
    [self.progressView hide];
}

@end
