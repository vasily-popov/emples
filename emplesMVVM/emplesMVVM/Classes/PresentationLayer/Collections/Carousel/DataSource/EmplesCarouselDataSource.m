//
//  EmplesCarouselDataSource.m
//  emplesMVVM
//
//  Created by Vasily Popov on 11/5/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

#import "EmplesCarouselDataSource.h"
#import "EmplesItemView.h"
#import "DataSourceItem.h"

@interface EmplesCarouselDataSource ()

@property (nonatomic, strong) NSMutableArray *source;

@end

@implementation EmplesCarouselDataSource

- (instancetype)initWithSource:(NSArray*)source
{
    self = [super init];
    if (self)
    {
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

#pragma mark - delegate

- (NSInteger)numberOfItemsInCarousel:(iCarousel *)carousel
{
    return self.source.count;
}

- (UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSInteger)index reusingView:(nullable UIView *)view
{
    if (view == nil)
    {
        view = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([EmplesItemView class])
                                              owner:self options:nil] firstObject];
        CGRect screenSize = [[UIScreen mainScreen] bounds];
        CGRect size = CGRectMake(0, 0, screenSize.size.width *0.75, screenSize.size.height *0.75);
        [view setFrame:size];
    }
    if([view isKindOfClass:[EmplesItemView class]])
    {
        DataSourceItem *item = self.source[index];
        [(EmplesItemView*)view configureWithModel:item.cellModel];
    }
    
    return view;
}

@end
