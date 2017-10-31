//
//  EmplesDetailController.m
//  emplesMVC
//
//  Created by Vasily Popov on 10/30/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

#import "EmplesDetailController.h"

@interface EmplesDetailController ()

@property (nonatomic, strong) EmplesDetailAreaModel *model;

@end

@implementation EmplesDetailController

-(instancetype)initWithModel:(EmplesDetailAreaModel*)model
{
    self = [super init];
    if (self) {
        self.model = model;
    }
    return self;
}

@end
