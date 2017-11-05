//
//  EmplesCarouselController.m
//  emplesMVC
//
//  Created by Vasily Popov on 10/31/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

#import "EmplesCarouselViewModel.h"
#import "EmplesListSourceBuilder.h"
#import "DataSourceItem.h"
#import "EmplesViewCellDecorator.h"

@interface EmplesCarouselViewModel()
{
    EmplesCarouselDataSource *carouselSource;
    EmplesCarouselDelegate *carouselDelegate;
}

@end

@implementation EmplesCarouselViewModel

-(NSString *)title
{
    return [@"Carousel" uppercaseString];
}

-(EmplesCarouselDataSource *)dataSource
{
    if(!carouselSource)
    {
        carouselSource = [[EmplesCarouselDataSource alloc] init];
    }
    return carouselSource;
}

-(EmplesCarouselDelegate *)delegate
{
    if(!carouselDelegate)
    {
        carouselDelegate = [[EmplesCarouselDelegate alloc] initWithDataSource:self.dataSource];
    }
    return carouselDelegate;
}

-(NSArray*) prepareCollectionArrayFromArray:(NSArray *)areas;
{
    NSArray *models = [EmplesListSourceBuilder buildSourceFromItems:areas];
    
    NSMutableArray *sourceArray = [NSMutableArray array];
    @weakify(self)
    for (id<ViewCellModelProtocol> model in models)
    {
        DataSourceItem *row = [[DataSourceItem alloc] initWithCellModel:model];
        row.rowHeight = 50;
        row.command = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id cellModel)
                       {
                           @strongify(self)
                           [self selectedItem:((EmplesViewCellDecorator*)cellModel).ponsoModel];
                           return [RACSignal empty];
                       }];
        [sourceArray addObject:row];
    }
    return sourceArray;
}

@end
