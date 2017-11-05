//
//  EmplesMenuCellModel.m
//  emplesMVC
//
//  Created by Vasily Popov on 10/28/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

#import "EmplesMenuCellViewModel.h"
#import "EmplesMenuViewCell.h"

@implementation EmplesMenuCellViewModel

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
    return NSStringFromClass([EmplesMenuViewCell class]);
}

@end
