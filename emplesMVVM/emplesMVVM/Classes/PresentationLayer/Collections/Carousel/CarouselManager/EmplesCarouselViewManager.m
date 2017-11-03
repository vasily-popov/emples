//
//  EmplesCarouselViewManager.m
//  emplesMVC
//
//  Created by Vasily Popov on 10/31/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

#import "EmplesCarouselViewManager.h"
#import "EmplesItemView.h"
#import "DataSourceItem.h"

@interface EmplesCarouselViewManager () <iCarouselDelegate, iCarouselDataSource>

@property (nonatomic, strong) NSMutableArray *dataSource;

@end

@implementation EmplesCarouselViewManager

- (instancetype)initWithSource:(NSArray*)source
{
    self = [super init];
    if (self) {
        self.dataSource = [NSMutableArray arrayWithArray:source];
    }
    return self;
}

-(void)updateDataSource:(NSArray*)source
{
    self.dataSource = [NSMutableArray arrayWithArray:source];
}

-(void)appendItems:(NSArray*)items
{
    if(self.dataSource == nil)
    {
        self.dataSource = [NSMutableArray array];
    }
    [self.dataSource addObjectsFromArray:items];
}

- (id<iCarouselDataSource>)dataSourceForCarouselView:(iCarousel *)view
{
    return self;
}
- (id<iCarouselDelegate>)delegateForCarouselView:(iCarousel *)view
{
    return self;
}


#pragma mark iCarousel methods

- (NSInteger)numberOfItemsInCarousel:(iCarousel *)carousel
{
    return self.dataSource.count;
}
- (UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSInteger)index reusingView:(nullable UIView *)view
{
    if (view == nil)
    {
        view = [[[NSBundle mainBundle] loadNibNamed:@"EmplesItemView" owner:self options:nil] firstObject];
        CGRect screenSize = [[UIScreen mainScreen] bounds];
        CGRect size = CGRectMake(0, 0, screenSize.size.width *0.75, screenSize.size.height *0.75);
        [view setFrame:size];
    }
    if([view isKindOfClass:[EmplesItemView class]])
    {
        DataSourceItem *item = self.dataSource[index];
        [(EmplesItemView*)view configureWithModel:item.cellModel];
    }
    
    return view;
}

- (void)carousel:(iCarousel *)carousel didSelectItemAtIndex:(NSInteger)index
{
    DataSourceItem *item = self.dataSource[index];
    if (item.selectAction)
    {
        item.selectAction(item.cellModel);
    }
}

@end
