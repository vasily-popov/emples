//
//  EmplesListView.m
//  emplesMVC
//
//  Created by Vasily Popov on 10/28/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

#import "EmplesListView.h"
#import "EmplesListTableViewManager.h"
#import "EmplesProgressView.h"
#import "EmplesListController.h"
#import "ColorStrings.h"

@interface EmplesListView ()

@property (strong, nonatomic) UITableView *table;
@property (strong, nonatomic) EmplesListTableViewManager *sourceManager;
@property (strong, nonatomic) EmplesProgressView *progressView;

@end

@implementation EmplesListView

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = [@"List" uppercaseString];
    [self createTableView];
    self.progressView = [[EmplesProgressView alloc] initWithFrame:CGRectZero];
    [self.navigationController.view addSubview:self.progressView];
    [self setupConstraints];
    [self.controller viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)dealloc
{
    
}

-(void)setupConstraints
{
    self.progressView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.progressView.leftAnchor constraintEqualToAnchor:self.navigationController.view.leftAnchor constant:0].active = YES;
    [self.progressView.rightAnchor constraintEqualToAnchor:self.navigationController.view.rightAnchor constant:0].active = YES;
    [self.progressView.topAnchor constraintEqualToAnchor:self.navigationController.view.topAnchor constant:0].active = YES;
    [self.progressView.bottomAnchor constraintEqualToAnchor:self.navigationController.view.bottomAnchor constant:0].active = YES;
}

-(void)createTableView
{
    self.table = [[UITableView alloc] initWithFrame:self.view.bounds
                                              style:UITableViewStylePlain];
    self.table.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.table.backgroundColor = [UIColor colorNamed:emplesGreenColor];
    [self.table setAutoresizingMask:UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth];
    [self.view addSubview:self.table];
    self.sourceManager = [[EmplesListTableViewManager alloc] init];
    self.table.dataSource = [self.sourceManager dataSourceForTableView:self.table];
    self.table.delegate = [self.sourceManager delegateForTableView:self.table];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)showProgressView
{
    [self.progressView show];
}

-(void)hideProgressView
{
    [self.progressView hide];
}

-(void)showData
{
    [self.sourceManager updateDataSource:self.model.dataSource];
    [self.table reloadData];
}
@end
