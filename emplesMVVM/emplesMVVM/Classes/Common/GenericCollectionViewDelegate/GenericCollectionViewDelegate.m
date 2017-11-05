//
//  GenericCollectionViewDelegate.m
//  emplesMVVM
//
//  Created by Vasily Popov on 11/5/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

#import "GenericCollectionViewDelegate.h"
#import "GenericGridViewSource.h"
#import "DataGridSourceItem.h"

@interface GenericCollectionViewDelegate ()

@property (nonatomic, strong) GenericGridViewSource *viewSource;

@end

@implementation GenericCollectionViewDelegate

-(instancetype) initWithDataSource:(GenericGridViewSource*) viewSource
{
    self = [super init];
    if(self)
    {
        self.viewSource = viewSource;
    }
    return self;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    DataGridSourceItem *row = self.viewSource.source[indexPath.row];
    [row.command execute:row.cellModel];
}


@end
