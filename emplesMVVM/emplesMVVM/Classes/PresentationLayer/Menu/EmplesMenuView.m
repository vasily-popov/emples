//
//  EmplesMenuView.m
//  emplesMVC
//
//  Created by Vasily Popov on 10/28/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

#import "EmplesMenuView.h"
#import "EmplesMenuViewModel.h"
#import "ColorStrings.h"
#import "EmplesMenuViewCell.h"

@interface EmplesMenuView ()

@property (strong, nonatomic) UITableView *table;

@end

@implementation EmplesMenuView

- (void)viewDidLoad {
    [super viewDidLoad];
    [self bindViewModel];
    [self.viewModel viewDidLoad];
}

-(void)bindViewModel
{
    RAC(self, title) = RACObserve(self, viewModel.title);
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
        [_table registerCellNib:EmplesMenuViewCell.class];
    }
    return _table;
}

@end
