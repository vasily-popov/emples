//
//  EmplesListController.m
//  emplesMVC
//
//  Created by Vasily Popov on 10/29/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

#import "EmplesListViewModel.h"
#import "EmplesListSourceBuilder.h"
#import "DataSourceItem.h"
#import "EmplesViewCellDecorator.h"

#import "GenericTableViewSource.h"
#import "GenericTableViewDelegate.h"

@interface EmplesListViewModel()

@property (nonatomic, strong) GenericTableViewSource *viewSource;
@property (nonatomic, strong) GenericTableViewDelegate *viewDelegate;

@end

@implementation EmplesListViewModel

-(GenericTableViewSource *)dataSource
{
    if(!_viewSource)
    {
        _viewSource = [[GenericTableViewSource alloc] init];
    }
    return _viewSource;
}

-(GenericTableViewDelegate *)delegate
{
    if(!_viewDelegate)
    {
        _viewDelegate = [[GenericTableViewDelegate alloc] initWithDataSource:self.dataSource];
    }
    return _viewDelegate;
}

-(NSString *)title
{
    return [@"List" uppercaseString];
}

-(NSArray*) prepareCollectionArrayFromArray:(NSArray *)areas;
{
    NSArray *models = [EmplesListSourceBuilder buildSourceFromItems:areas];
    
    NSMutableArray *sourceArray = [NSMutableArray array];
    @weakify(self)
    for (id<ViewCellModelProtocol> model in models)
    {
        DataSourceItem *row = [[DataSourceItem alloc] initWithCellModel:model];
        row.rowHeight = 50;
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

-(void)dealloc
{
    
}

@end
