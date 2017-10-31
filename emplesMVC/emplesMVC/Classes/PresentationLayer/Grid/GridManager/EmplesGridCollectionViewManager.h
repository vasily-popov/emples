//
//  EmplesGridCollectionViewManager.h
//  emplesMVC
//
//  Created by Vasily Popov on 10/30/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol UIGridCollectionSourceManager <NSObject>

- (instancetype)initWithSource:(NSArray*)source;
- (void)updateDataSource:(NSArray*)source;
- (void)appendItems:(NSArray*)items;
- (id<UICollectionViewDataSource>)dataSourceForCollectionView:(UICollectionView *)collectionView;
- (id<UICollectionViewDelegate>)delegateForCollectionView:(UICollectionView *)collectionView;

@end

@interface EmplesGridCollectionViewManager : NSObject <UIGridCollectionSourceManager>

@end
