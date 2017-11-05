//
//  EmplesGridController.m
//  emplesMVC
//
//  Created by Vasily Popov on 10/30/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

#import "EmplesGridViewModel.h"
#import "EmplesGridSourceBuilder.h"
#import "DataGridSourceItem.h"
#import "EmplesViewCellDecorator.h"

@interface EmplesGridViewModel()
{
    GenericGridViewSource *source;
    GenericCollectionViewDelegate *viewDelegate;
}

@end

@implementation EmplesGridViewModel

-(NSString *)title
{
    return [@"Grid" uppercaseString];
}

-(GenericGridViewSource *)dataSource
{
    if(!source)
    {
        source = [[GenericGridViewSource alloc] init];
    }
    return source;
}

-(GenericCollectionViewDelegate *)delegate
{
    if(!viewDelegate)
    {
        viewDelegate = [[GenericCollectionViewDelegate alloc] initWithDataSource:self.dataSource];
    }
    return viewDelegate;
}

-(NSArray*) prepareCollectionArrayFromArray:(NSArray *)areas;
{
    NSArray *models = [EmplesGridSourceBuilder buildSourceFromItems:areas];
    
    NSMutableArray *sourceArray = [NSMutableArray array];
    @weakify(self)
    for (id<ViewCellModelProtocol> model in models)
    {
        DataGridSourceItem *row = [[DataGridSourceItem alloc] initWithCellModel:model];
        row.command = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id cellModel)
                       {
                           @strongify(self)
                           [self selectedItem:((EmplesViewCellDecorator*)cellModel).ponsoModel];
                           return [RACSignal empty];
                       }];
        [sourceArray addObject:row];
    }
    return sourceArray;
}

@end
