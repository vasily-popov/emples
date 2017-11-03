//
//  EmplesGridController.m
//  emplesMVC
//
//  Created by Vasily Popov on 10/30/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

#import "EmplesGridPresenter.h"
#import "EmplesGridSourceBuilder.h"
#import "DataGridSourceItem.h"

@interface EmplesGridPresenter ()

@end

@implementation EmplesGridPresenter


-(NSArray*) prepareCollectionArrayFromArray:(NSArray *)areas;
{
    NSArray *models = [EmplesGridSourceBuilder buildSourceFromItems:areas];
    
    NSMutableArray *sourceArray = [NSMutableArray array];
    __weak typeof(self) weakSelf = self;
    for (id<ViewCellModelProtocol> model in models)
    {
        DataGridSourceItem *row = [[DataGridSourceItem alloc] initWithCellModel:model];
        row.selectAction = ^(id<ViewCellModelProtocol> cellModel)
        {
            __strong typeof(self) strongSelf = weakSelf;
            if(strongSelf)
            {
                //[strongSelf selectedItem:cellModel.ponsoModel];
            }
        };
        [sourceArray addObject:row];
    }
    return sourceArray;
}

@end
