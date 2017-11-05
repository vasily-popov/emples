//
//  EmplesListView.m
//  emplesMVC
//
//  Created by Vasily Popov on 10/28/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

#import "EmplesListView.h"
#import "EmplesCollectionViewModel.h"
#import "ColorStrings.h"
#import "EmplesListCellView.h"

@interface EmplesListView ()

@property (strong, nonatomic) UITableView *table;

@end

@implementation EmplesListView

@synthesize viewModel;

- (void)viewDidLoad {
    [super viewDidLoad];
    [self bindViewModel];
    [self.viewModel viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)bindViewModel
{
    RAC(self, title) = RACObserve(self, viewModel.title);
    RAC(self.table, dataSource) = RACObserve(self, viewModel.dataSource);
    RAC(self.table, delegate) = RACObserve(self, viewModel.delegate);
    
    @weakify(self);
    [[[RACObserve(self.viewModel.dataSource, source) ignore:nil] distinctUntilChanged]
     subscribeNext:^(id _)
     {
         @strongify(self);
         [self.table reloadData];
     }];
    
    [[[self.viewModel.loadItemsAction.executing skipWhileBlock:^ BOOL (NSNumber *loading) {
        // Skip until we start loading.
        return !loading.boolValue;
    }] distinctUntilChanged]
     subscribeNext:^(NSNumber *loading) {
         @strongify(self);
         if (loading.boolValue) {
             [self showProgressView];
         } else {
             [self hideProgressView];
         }
     }];
}

-(void)dealloc
{
    
}

-(UITableView*)table
{
    if(!_table)
    {
        _table = [[UITableView alloc] initWithFrame:self.view.bounds
                                              style:UITableViewStylePlain];
        _table.separatorStyle = UITableViewCellSeparatorStyleNone;
        _table.backgroundColor = [UIColor colorNamed:emplesGreenColor];
        [_table setAutoresizingMask:UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth];
        [self.view addSubview:_table];
        [_table registerCellNib:EmplesListCellView.class];
    }
    return _table;
}

@end
