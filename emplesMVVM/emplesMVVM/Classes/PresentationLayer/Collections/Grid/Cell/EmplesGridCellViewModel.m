//
//  EmplesGridCellModel.m
//  emplesMVC
//
//  Created by Vasily Popov on 10/30/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

#import "EmplesGridCellViewModel.h"
#import "EmplesGridViewCell.h"

@implementation EmplesGridCellViewModel

-(instancetype)init
{
    self = [super init];
    if(self)
    {
        self.textColor = [UIColor blackColor];
        self.bgColor = [UIColor whiteColor];
        self.font = [UIFont systemFontOfSize:16];
    }
    return self;
}

- (id)getModelValue
{
    return self.text;
}

- (NSString *)cellClassName
{
    return NSStringFromClass([EmplesGridViewCell class]);
}

@end
