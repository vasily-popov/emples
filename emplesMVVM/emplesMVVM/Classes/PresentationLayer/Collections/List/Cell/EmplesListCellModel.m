//
//  EmplesListCellModel.m
//  emplesMVC
//
//  Created by Vasily Popov on 10/29/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

#import "EmplesListCellModel.h"
#import "EmplesListCellView.h"

@implementation EmplesListCellModel

-(instancetype)init
{
    self = [super init];
    if(self)
    {
        self.textColor = [UIColor blackColor];
        self.bgColor = [UIColor whiteColor];
        self.font = [UIFont systemFontOfSize:16];
        self.secondFont = [UIFont systemFontOfSize:14];
        self.secondColor = [UIColor greenColor];
    }
    return self;
}

- (id)getModelValue
{
    return self.text;
}

- (NSString *)cellClassName
{
    return NSStringFromClass([EmplesListCellView class]);
}

@end
