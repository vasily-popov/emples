//
//  EmplesGridModelDecorator.m
//  emplesMVC
//
//  Created by Vasily Popov on 10/30/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

#import "EmplesGridModelDecorator.h"
#import "DataGridSourceItem.h"
#import "EmplesRecAreaJSONModel.h"
#import "EmplesGridCellModel.h"

@interface EmplesGridModelDecorator()

@property (nonatomic, strong) EmplesAreasModel* model;

@end

@implementation EmplesGridModelDecorator

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

-(NSArray<DataGridSourceItem*>*)dataSource
{
    __weak typeof(self) weakSelf = self;
    NSMutableArray *sourseItems = [NSMutableArray arrayWithCapacity:self.model.dataSource.count];
    for (int index = 0; index < self.model.dataSource.count; index ++)
    {
        EmplesRecAreaJSONModel *item = self.model.dataSource[index];
        EmplesGridCellModel *model = [EmplesGridCellModel new];
        model.text = item.RecAreaName;
        model.imageURL = item.imageURL;
        DataGridSourceItem *row = [[DataGridSourceItem alloc] initWithCellModel:model];
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
