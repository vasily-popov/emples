//
//  EmplesDetailController.m
//  emplesMVC
//
//  Created by Vasily Popov on 10/30/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

#import "EmplesDetailPresenter.h"

@interface EmplesDetailPresenter ()

@property (nonatomic, strong) EmplesDetailAreaModel *model;

@end

@implementation EmplesDetailPresenter

-(instancetype)initWithModel:(EmplesDetailAreaModel*)model
{
    self = [super init];
    if (self) {
        self.model = model;
    }
    return self;
}

-(void)viewDidLoad
{
    [self.view setViewTitle:[[self.model titleName] uppercaseString]];
    [self.view setSourceArray:self.model.dataSource];
}

@end
