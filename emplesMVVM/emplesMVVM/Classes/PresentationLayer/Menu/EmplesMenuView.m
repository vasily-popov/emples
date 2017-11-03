//
//  EmplesMenuView.m
//  emplesMVC
//
//  Created by Vasily Popov on 10/28/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

#import "EmplesMenuView.h"
#import "EmplesMenuTableViewManager.h"
#import "EmplesMenuPresenter.h"
#import "ColorStrings.h"

@interface EmplesMenuView ()

@property (strong, nonatomic) UITableView *table;
@property (strong, nonatomic) EmplesMenuTableViewManager *sourceManager;

@end

@implementation EmplesMenuView

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = [@"Menu" uppercaseString];
    [self createTableView];
    [self.presenter viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)createTableView
{
    self.table = [[UITableView alloc] initWithFrame:self.view.bounds
                                              style:UITableViewStylePlain];
    self.table.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.table.backgroundColor = [UIColor colorNamed:lightWhiteColor];
    [self.table setAutoresizingMask:UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth];
    [self.view addSubview:self.table];
    self.sourceManager = [[EmplesMenuTableViewManager alloc] init];
    self.table.dataSource = [self.sourceManager dataSourceForTableView:self.table];
    self.table.delegate = [self.sourceManager delegateForTableView:self.table];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - EmplesMenuViewProtocol

-(void) setTableDataSource:(NSArray*)array
{
    [self.sourceManager updateDataSource:array];
    [self.table reloadData];
}
@end
