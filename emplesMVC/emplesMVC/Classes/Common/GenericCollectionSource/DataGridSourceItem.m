//
//  DataGridSourceItem.m
//  emplesMVC
//
//  Created by Vasily Popov on 10/30/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

#import "DataGridSourceItem.h"

@implementation DataGridSourceItem

- (instancetype)initWithCellModel:(id<ViewCellModelProtocol>)cellModel
{
    self = [super init];
    if (self)
    {
        self.cellModel = cellModel;
        self.itemSize = CGSizeMake(50, 50);
    }
    
    return self;
}

- (id)value
{
    return [self.cellModel getModelValue];
}

@end
