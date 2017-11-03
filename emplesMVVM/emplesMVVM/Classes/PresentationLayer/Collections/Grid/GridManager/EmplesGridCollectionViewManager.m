//
//  EmplesGridCollectionViewManager.m
//  emplesMVC
//
//  Created by Vasily Popov on 10/30/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

#import "EmplesGridCollectionViewManager.h"
#import "UICollectionView+Reusable.h"
#import "DataGridSourceItem.h"
#import "GenericGridViewSource.h"
#import "EmplesGridViewCell.h"

@interface EmplesGridCollectionViewManager () <UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) GenericGridViewSource *dataSource;

@end

@implementation EmplesGridCollectionViewManager


#pragma mark - UIGridCollectionSourceManager

- (instancetype)initWithSource:(NSArray*)source
{
    self = [super init];
    if (self)
    {
        self.dataSource = [[GenericGridViewSource alloc] initWithSource:source];
    }
    return self;
}

-(void)updateDataSource:(NSArray*)source
{
    if(!self.dataSource)
    {
        self.dataSource = [[GenericGridViewSource alloc] initWithSource:source];
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
        self.dataSource = [[GenericGridViewSource alloc] initWithSource:items];
    }
    else
    {
        [self.dataSource appendItems:items];
    }
}

-(void)registerCellsForTable:(UITableView*)tableView
{
    
}

- (id<UICollectionViewDataSource>)dataSourceForCollectionView:(UICollectionView *)collectionView
{
    [self registerCellsForCollection:collectionView];
    if(!self.dataSource)
    {
        self.dataSource = [[GenericGridViewSource alloc] init];
    }
    return self.dataSource;
}
- (id<UICollectionViewDelegate>)delegateForCollectionView:(UICollectionView *)collectionView
{
    return self;
}

#pragma mark - UICollectionViewDelegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    DataGridSourceItem *item = self.dataSource.source[indexPath.row];
    if (item.selectAction)
    {
        item.selectAction(item.cellModel);
    }
}

-(void)registerCellsForCollection:(UICollectionView*)collectionView
{
    [collectionView registerCellNib:EmplesGridViewCell.class];
}

@end
