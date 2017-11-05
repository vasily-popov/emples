//
//  EmplesStackedController.m
//  emplesMVC
//
//  Created by Vasily Popov on 10/31/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

#import "EmplesStackedViewModel.h"
#import "EmplesListSourceBuilder.h"
#import "DataSourceItem.h"
#import "EmplesViewCellDecorator.h"

@interface EmplesStackedViewModel()

@property (nonatomic, strong) EmplesSwipeableViewDataSource *source;

@end

@implementation EmplesStackedViewModel

-(NSString *)title
{
    return [@"Stack" uppercaseString];
}

-(EmplesSwipeableViewDataSource *)dataSource
{
    if(!_source)
    {
        _source = [[EmplesSwipeableViewDataSource alloc] init];
    }
    return _source;
}

-(id)delegate
{
    return nil;
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
