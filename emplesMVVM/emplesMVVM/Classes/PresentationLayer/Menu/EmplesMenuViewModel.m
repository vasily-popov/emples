//
//  EmplesMenuViewModel.m
//  emplesMVVM
//
//  Created by Vasily Popov on 11/3/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

#import "EmplesMenuViewModel.h"
#import "EmplesMenuModel.h"
#import "GenericTableViewSource.h"
#import "GenericTableViewDelegate.h"

#import "DataSourceItem.h"
#import "EmplesMenuCellViewModel.h"

@interface EmplesMenuViewModel()

@property (nonatomic, strong) EmplesMenuModel* model;
@property (nonatomic, strong) GenericTableViewSource *dataSource;
@property (nonatomic, strong) GenericTableViewDelegate *delegate;

@end

@implementation EmplesMenuViewModel

@synthesize title = _title;

- (instancetype)initWithModel:(EmplesMenuModel *)model
{
    self = [super init];
    if (self)
    {
        self.model = model;
        [self initialize];
    }
    return self;
}

-(void)initialize
{
    _title = [@"Menu" uppercaseString];
    _dataSource = [[GenericTableViewSource alloc] init];
    _delegate = [[GenericTableViewDelegate alloc] initWithDataSource:_dataSource];
}

-(void)viewDidLoad
{
    [_dataSource setDataSource:[self buildSourceModel]];
}

-(NSArray*)buildSourceModel
{
    @weakify(self)
    NSMutableArray *sourseItems = [NSMutableArray arrayWithCapacity:self.model.items.count];
    for (int index = 0; index < self.model.items.count; index ++)
    {
        NSString *item = self.model.items[index];
        EmplesMenuCellViewModel *model = [EmplesMenuCellViewModel new];
        model.text = item;
        DataSourceItem *row = [[DataSourceItem alloc] initWithCellModel:model];
        row.rowHeight = 50;
        row.command = [[RACCommand alloc] initWithSignalBlock:^RACSignal * _Nonnull(id  _Nullable input)
        {
            @strongify(self)
            EnumMenuSelectedItem selectedIndex = index;
            [self.router navigateToSelectedItem:selectedIndex];
            return [RACSignal empty];
        }];
        [sourseItems addObject:row];
    }
    return sourseItems;
}


@end
