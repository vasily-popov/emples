//
//  GenericTableViewManager.m
//  emplesMVC
//
//  Created by Vasily Popov on 10/28/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

#import "GenericTableViewManager.h"
#import "DataSourceItem.h"
#import "GenericTableViewSource.h"

@interface GenericTableViewManager () <UITableViewDelegate>

@property (nonatomic, strong) GenericTableViewSource *dataSource;

@end

@implementation GenericTableViewManager

#pragma mark - UITableSourceManager

- (instancetype)initWithSource:(NSArray*)source
{
    self = [super init];
    if (self)
    {
        self.dataSource = [[GenericTableViewSource alloc] initWithSource:source];
    }
    return self;
}

-(void)updateDataSource:(NSArray*)source
{
    if(!self.dataSource)
    {
        self.dataSource = [[GenericTableViewSource alloc] initWithSource:source];
    }
    else
    {
        [self.dataSource setDataSource:source];
    }
}

-(void)appendItems:(NSArray*)items
{
    if(!self.dataSource)
    {
        self.dataSource = [[GenericTableViewSource alloc] initWithSource:items];
    }
    else
    {
        [self.dataSource appendItems:items];
    }
}

-(void)registerCellsForTable:(UITableView*)tableView
{
    
}

- (id<UITableViewDataSource>)dataSourceForTableView:(UITableView *)tableView
{
    [self registerCellsForTable:tableView];
    if(!self.dataSource)
    {
        self.dataSource = [[GenericTableViewSource alloc] init];
    }
    return self.dataSource;
}
- (id<UITableViewDelegate>)delegateForTableView:(UITableView *)tableView
{
    return self;
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    DataSourceItem *row = self.dataSource.source[indexPath.row];
    return row.rowHeight;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    DataSourceItem *row = self.dataSource.source[indexPath.row];
    if (row.selectAction)
    {
        row.selectAction(row.cellModel);
    }
}
@end
