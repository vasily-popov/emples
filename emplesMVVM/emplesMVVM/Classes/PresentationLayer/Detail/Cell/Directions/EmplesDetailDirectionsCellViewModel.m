//
//  EmplesDetailDirectionsCellModel.m
//  emplesMVC
//
//  Created by Vasily Popov on 10/30/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

#import "EmplesDetailDirectionsCellViewModel.h"
#import "EmplesDetailDirectionTextViewCell.h"

@implementation EmplesDetailDirectionsCellViewModel

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
    return self.directionText;
}

- (NSString *)cellClassName
{
    return NSStringFromClass([EmplesDetailDirectionTextViewCell class]);
}


@end
