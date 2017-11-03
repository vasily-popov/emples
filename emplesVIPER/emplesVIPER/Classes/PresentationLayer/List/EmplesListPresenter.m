//
//  EmplesListController.m
//  emplesMVC
//
//  Created by Vasily Popov on 10/29/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

#import "EmplesListPresenter.h"
#import "EmplesListSourceBuilder.h"
#import "EmplesListCellModel.h"
#import "DataSourceItem.h"

@implementation EmplesListPresenter

-(NSArray*) prepareCollectionArrayFromArray:(NSArray *)areas;
{
    NSArray *models = [EmplesListSourceBuilder buildSourceFromItems:areas];
    
    NSMutableArray *sourceArray = [NSMutableArray array];
    __weak typeof(self) weakSelf = self;
    for (id<ViewCellModelProtocol> model in models)
    {
        DataSourceItem *row = [[DataSourceItem alloc] initWithCellModel:model];
        row.rowHeight = 50;
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
