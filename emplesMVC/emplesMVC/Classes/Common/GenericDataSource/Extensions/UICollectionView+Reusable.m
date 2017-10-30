//
//  UICollectionView+Reusable.m
//  emplesMVC
//
//  Created by Vasily Popov on 10/28/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

#import "UICollectionView+Reusable.h"

@implementation UICollectionView (Reusable)

-(void)registerCell:(Class<ReusableViewProtocol>) type
{
    [self registerClass:type forCellWithReuseIdentifier:[type defaultReuseIdentifier]];
}

-(void)registerCellNib:(Class<NibLoadableViewProtocol,ReusableViewProtocol>) type
{
    NSBundle *bundle = [NSBundle mainBundle];
    UINib *nib = [UINib nibWithNibName:[type nibName]
                                bundle:bundle];
    [self registerNib:nib forCellWithReuseIdentifier:[type defaultReuseIdentifier]];
}

@end

