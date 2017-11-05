//
//  GenericTableViewDelegate.m
//  emplesMVVM
//
//  Created by Vasily Popov on 11/5/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

#import "GenericTableViewDelegate.h"
#import "GenericTableViewSource.h"
#import "DataSourceItem.h"

@interface GenericTableViewDelegate ()

@property (nonatomic, strong) GenericTableViewSource *viewSource;

@end

@implementation GenericTableViewDelegate

-(instancetype) initWithDataSource:(GenericTableViewSource*) viewSource
{
    self = [super init];
    if(self)
    {
        self.viewSource = viewSource;
    }
    return self;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    DataSourceItem *row = self.viewSource.source[indexPath.row];
    return row.rowHeight;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    DataSourceItem *row = self.viewSource.source[indexPath.row];
    [row.command execute:row.cellModel];
}

@end
