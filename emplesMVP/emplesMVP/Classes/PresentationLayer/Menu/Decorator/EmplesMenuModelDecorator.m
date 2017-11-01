//
//  EmplesMenuModelDecorator.m
//  emplesMVC
//
//  Created by Vasily Popov on 10/29/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

#import "EmplesMenuModelDecorator.h"
#import "EmplesMenuModel.h"
#import "EmplesMenuCellModel.h"
#import "DataSourceItem.h"
#import "EnumMenuSelectedItem.h"

@interface EmplesMenuModelDecorator()

@property (nonatomic, strong) EmplesMenuModel* model;

@end

@implementation EmplesMenuModelDecorator

- (instancetype)initWithModel:(EmplesMenuModel*)model
{
    self = [super init];
    if (self) {
        self.model = model;
    }
    return self;
}

-(NSArray<DataSourceItem*>*)dataSource
{
    __weak typeof(self) weakSelf = self;
    NSMutableArray *sourseItems = [NSMutableArray arrayWithCapacity:self.model.dataSource.count];
    for (int index = 0; index < self.model.dataSource.count; index ++)
    {
        NSString *item = self.model.dataSource[index];
        EmplesMenuCellModel *model = [EmplesMenuCellModel new];
        model.text = item;
        DataSourceItem *row = [[DataSourceItem alloc] initWithCellModel:model];
        row.rowHeight = 50;
        row.selectAction = ^(EmplesMenuCellModel *cellModel)
        {
            __strong typeof(self) strongSelf = weakSelf;
            if(strongSelf.model.delegate)
            {
                EnumMenuSelectedItem item = index;
                [strongSelf.model.delegate selectedItem:item];
            }
        };
        [sourseItems addObject:row];
    }
    return sourseItems;
}



@end
