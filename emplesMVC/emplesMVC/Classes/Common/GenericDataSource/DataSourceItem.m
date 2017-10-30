//
//  DataSourceItem.m
//  emplesMVC
//
//  Created by Vasily Popov on 10/28/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

#import "DataSourceItem.h"

@implementation DataSourceItem

- (instancetype)initWithCellModel:(id<ViewCellModelProtocol>)cellModel
{
    self = [super init];
    if (self)
    {
        self.cellModel = cellModel;
        self.rowHeight = 60;
    }
    
    return self;
}

-(float)getRowHeight
{
    return self.rowHeight;
}

- (id)value
{
    return [self.cellModel getModelValue];
}


@end
