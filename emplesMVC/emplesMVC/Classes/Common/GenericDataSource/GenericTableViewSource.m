//
//  GenericDataSource.m
//  emplesMVC
//
//  Created by Vasily Popov on 10/28/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

#import "GenericTableViewSource.h"
#import "DataSourceItem.h"
#import "ViewCellProtocol.h"

@interface GenericTableViewSource()

@property (nonatomic, strong) NSMutableArray *source;

@end

@implementation GenericTableViewSource

- (instancetype)initWithSource:(NSArray*)source
{
    self = [super init];
    if (self) {
        self.source = [NSMutableArray arrayWithArray:source];
    }
    return self;
}

-(void)setDataSource:(NSArray*)source
{
    self.source = [NSMutableArray arrayWithArray:source];
}

-(void)appendItems:(NSArray*)items
{
    if(self.source == nil)
    {
        self.source = [NSMutableArray array];
    }
    [self.source addObjectsFromArray:items];
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.source.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    DataSourceItem *item = self.source[indexPath.row];
    UITableViewCell<ViewCellProtocol> *cell = [tableView dequeueReusableCellWithIdentifier:[item.cellModel cellClassName] forIndexPath:indexPath];
    [cell configureWithModel:item.cellModel];
    return cell;
}

@end
