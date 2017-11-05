//
//  EmplesSwipeableViewDataSource.m
//  emplesMVVM
//
//  Created by Vasily Popov on 11/5/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

#import "EmplesSwipeableViewDataSource.h"
#import "UICollectionView+Reusable.h"
#import "EmplesItemView.h"
#import "DataSourceItem.h"

@interface EmplesSwipeableViewDataSource ()
{
    int currentIndex;
    int numberOfActiveViews;
}

@property (nonatomic, strong) NSMutableArray *source;

@end

@implementation EmplesSwipeableViewDataSource

- (instancetype)initWithSource:(NSArray*)source
{
    self = [super init];
    if (self)
    {
        self.source = [NSMutableArray arrayWithArray:source];
        currentIndex = 0;
    }
    return self;
}

-(void)setDataSource:(NSArray*)source
{
    self.source = [NSMutableArray arrayWithArray:source];
    currentIndex = 0;
}

-(void)appendItems:(NSArray*)items
{
    if(self.source == nil)
    {
        self.source = [NSMutableArray array];
        currentIndex = 0;
    }
    [self.source addObjectsFromArray:items];
}

- (UIView *)nextViewForSwipeableView:(ZLSwipeableView *)swipeableView
{
    numberOfActiveViews = (int)swipeableView.numberOfActiveViews;
    if (currentIndex >= self.source.count)
    {
        currentIndex = 0;
        //return nil;
    }
    EmplesItemView *view = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([EmplesItemView class])
                                                          owner:self options:nil] firstObject];
    CGRect size = CGRectMake(0, 0, swipeableView.frame.size.width *0.8, swipeableView.frame.size.height *0.8);
    [view setFrame:size];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didItemTap:)];
    tap.numberOfTapsRequired = 1;
    [view setUserInteractionEnabled:YES];
    [view addGestureRecognizer:tap];
    
    DataSourceItem *item = self.source[currentIndex++];
    [view configureWithModel:item.cellModel];
    return view;
    
}

-(void)didItemTap:(UITapGestureRecognizer*)recognizer
{
    int topIndex = currentIndex - numberOfActiveViews;
    if(topIndex < 0)
    {
        topIndex += (int)self.source.count;
    }
    DataSourceItem *row = self.source[topIndex];
    [row.command execute:row.cellModel];
}

@end
