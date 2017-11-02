//
//  EmplesStackedViewManager.m
//  emplesMVC
//
//  Created by Vasily Popov on 10/31/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

#import "EmplesStackedViewManager.h"
#import "UICollectionView+Reusable.h"
#import "EmplesItemView.h"
#import "DataSourceItem.h"

@interface EmplesStackedViewManager () <ZLSwipeableViewDataSource, ZLSwipeableViewDelegate>
{
    int currentIndex;
    int numberOfActiveViews;
}
@property (nonatomic, strong) NSMutableArray *dataSource;

@end

@implementation EmplesStackedViewManager

- (instancetype)initWithSource:(NSArray*)source
{
    self = [super init];
    if (self)
    {
        self.dataSource = [NSMutableArray arrayWithArray:source];
        currentIndex = 0;
    }
    return self;
}

-(void)updateDataSource:(NSArray*)source
{
    self.dataSource = [NSMutableArray arrayWithArray:source];
    currentIndex = 0;
}

-(void)appendItems:(NSArray*)items
{
    if(!self.dataSource)
    {
        self.dataSource = [NSMutableArray arrayWithArray:items];
        currentIndex = 0;
    }
    else
    {
        [self.dataSource addObjectsFromArray:items];
    }
}

- (id<ZLSwipeableViewDataSource>)dataSourceForStackedView:(ZLSwipeableView *)view
{
    return self;
}
- (id<ZLSwipeableViewDelegate>)delegateForStackedView:(ZLSwipeableView *)view
{
    return self;
}

#pragma mark -delegate

- (UIView *)nextViewForSwipeableView:(ZLSwipeableView *)swipeableView
{
    numberOfActiveViews = (int)swipeableView.numberOfActiveViews;
    if (currentIndex >= self.dataSource.count) {
        currentIndex = 0;
        //return nil;
    }
    EmplesItemView *view = [[[NSBundle mainBundle] loadNibNamed:@"EmplesItemView" owner:self options:nil] firstObject];
    CGRect size = CGRectMake(0, 0, swipeableView.frame.size.width *0.8, swipeableView.frame.size.height *0.8);
    [view setFrame:size];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didItemTap:)];
    tap.numberOfTapsRequired = 1;
    [view setUserInteractionEnabled:YES];
    [view addGestureRecognizer:tap];

    DataSourceItem *item = self.dataSource[currentIndex++];
    [view configureWithModel:item.cellModel];
    return view;
    
}

-(void)didItemTap:(UITapGestureRecognizer*)recognizer
{
    int topIndex = currentIndex - numberOfActiveViews;
    
    if(topIndex < 0)
    {
        topIndex += (int)self.dataSource.count;
    }

    DataSourceItem *item = self.dataSource[topIndex];
    if(item.selectAction)
    {
        item.selectAction(item.cellModel);
    }
}

@end
