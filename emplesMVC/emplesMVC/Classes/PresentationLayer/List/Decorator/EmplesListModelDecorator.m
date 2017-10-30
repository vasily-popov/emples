//
//  EmplesListModelDecorator.m
//  emplesMVC
//
//  Created by Vasily Popov on 10/29/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

#import "EmplesListModelDecorator.h"
#import "DataSourceItem.h"
#import "EmplesRecAreaJSONModel.h"

#import "EmplesListCellModel.h"

@interface EmplesListModelDecorator()

@property (nonatomic, strong) EmplesAreasModel* model;

@end

@implementation EmplesListModelDecorator

- (instancetype)initWithModel:(EmplesAreasModel*)model
{
    self = [super init];
    if (self) {
        self.model = model;
    }
    return self;
}

-(void)dealloc
{
    
}

-(NSArray<DataSourceItem*>*)dataSource
{
    __weak typeof(self) weakSelf = self;
    NSMutableArray *sourseItems = [NSMutableArray arrayWithCapacity:self.model.dataSource.count];
    for (int index = 0; index < self.model.dataSource.count; index ++)
    {
        EmplesRecAreaJSONModel *item = self.model.dataSource[index];
        EmplesListCellModel *model = [EmplesListCellModel new];
        model.text = item.RecAreaName;
        model.phone = item.RecAreaPhone;
        model.imageURL = item.imageURL;
        DataSourceItem *row = [[DataSourceItem alloc] initWithCellModel:model];
        row.rowHeight = 50;
        row.selectAction = ^(id<ViewCellModelProtocol> cellModel)
        {
            __strong typeof(self) strongSelf = weakSelf;
            if(strongSelf.model.delegate)
            {
                [strongSelf.model.delegate selectedItem:item];
            }
        };
        [sourseItems addObject:row];
    }
    return sourseItems;
}

@end
