//
//  EmplesDetailView.m
//  emplesMVC
//
//  Created by Vasily Popov on 10/28/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

#import "EmplesDetailView.h"
#import "EmplesDetailViewModel.h"
#import "ColorStrings.h"

#import "EmplesDetailDirectionTextViewCell.h"
#import "EmplesDetailTextViewWithImageViewCell.h"
#import "EmplesDeatilMapViewCell.h"

@interface EmplesDetailView ()

@property (strong, nonatomic) UITableView *table;

@end

@implementation EmplesDetailView

- (void)viewDidLoad {
    [super viewDidLoad];
    [self bindViewModel];
    [self.viewModel viewDidLoad];
}

-(void)bindViewModel
{
    RAC(self, title) = RACObserve(self.viewModel, title);
    RAC(self.table, dataSource) = RACObserve(self, viewModel.dataSource);
    RAC(self.table, delegate) = RACObserve(self, viewModel.delegate);
    
    @weakify(self);
    [[RACObserve(self.viewModel, dataSource) distinctUntilChanged]
     subscribeNext:^(id _)
     {
         @strongify(self);
         [self.table reloadData];
     }];
}

-(UITableView*)table
{
    if(!_table)
    {
        _table = [[UITableView alloc] initWithFrame:self.view.bounds
                                              style:UITableViewStylePlain];
        _table.separatorStyle = UITableViewCellSeparatorStyleNone;
        _table.backgroundColor = [UIColor colorNamed:lightWhiteColor];
        [_table setAutoresizingMask:UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth];
        [self.view addSubview:_table];
        [_table registerCellNib:EmplesDetailDirectionTextViewCell.class];
        [_table registerCellNib:EmplesDetailTextViewWithImageViewCell.class];
        [_table registerCell:EmplesDeatilMapViewCell.class];
    }
    return _table;
}


@end
