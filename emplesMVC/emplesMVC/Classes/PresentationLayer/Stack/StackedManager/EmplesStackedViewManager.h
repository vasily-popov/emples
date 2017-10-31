//
//  EmplesStackedViewManager.h
//  emplesMVC
//
//  Created by Vasily Popov on 10/31/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ZLSwipeableView/ZLSwipeableView.h>

@protocol UIStackedSourceManager <NSObject>

- (instancetype)initWithSource:(NSArray*)source;
- (void)updateDataSource:(NSArray*)source;
- (void)appendItems:(NSArray*)items;
- (id<ZLSwipeableViewDataSource>)dataSourceForStackedView:(ZLSwipeableView *)view;
- (id<ZLSwipeableViewDelegate>)delegateForStackedView:(ZLSwipeableView *)view;

@end

@interface EmplesStackedViewManager : NSObject <UIStackedSourceManager>

@end
