//
//  GenericGridViewSource.m
//  emplesMVC
//
//  Created by Vasily Popov on 10/30/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

#import "GenericGridViewSource.h"
#import "DataGridSourceItem.h"
#import "ViewCellProtocol.h"

@interface GenericGridViewSource()

@property (nonatomic, strong) NSMutableArray *source;

@end

@implementation GenericGridViewSource

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

#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.source.count;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    DataGridSourceItem *item = self.source[indexPath.row];
    UICollectionViewCell<ViewCellProtocol> *cell = [collectionView dequeueReusableCellWithReuseIdentifier:[item.cellModel cellClassName] forIndexPath:indexPath];
    [cell configureWithModel:item.cellModel];
    return cell;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

@end
