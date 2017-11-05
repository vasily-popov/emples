//
//  EmplesCarouselDelegate.m
//  emplesMVVM
//
//  Created by Vasily Popov on 11/5/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

#import "EmplesCarouselDelegate.h"
#import "DataSourceItem.h"
#import "EmplesCarouselDataSource.h"

@interface EmplesCarouselDelegate ()

@property (nonatomic, strong) EmplesCarouselDataSource *dataSource;

@end

@implementation EmplesCarouselDelegate

-(instancetype) initWithDataSource:(EmplesCarouselDataSource*) source
{
    self = [super init];
    if(self)
    {
        self.dataSource = source;
    }
    return self;
}

- (void)carousel:(iCarousel *)carousel didSelectItemAtIndex:(NSInteger)index
{
    DataSourceItem *row = self.dataSource.source[index];
    [row.command execute:row.cellModel];
}

@end
