//
//  EmplesDetailView.m
//  emplesMVC
//
//  Created by Vasily Popov on 10/28/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

#import "EmplesDetailView.h"
#import "EmplesDetailPresenter.h"
#import "EmplesDetailTableViewManager.h"
#import "ColorStrings.h"

@interface EmplesDetailView ()

@property (strong, nonatomic) UITableView *table;
@property (strong, nonatomic) EmplesDetailTableViewManager *sourceManager;

@end

@implementation EmplesDetailView

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createTableView];
    [self.presenter viewDidLoad];
}

-(void)setViewTitle:(NSString*)title
{
    self.title = title;
}

-(void)setSourceArray:(NSArray*)array
{
    [self.sourceManager updateDataSource:array];
    [self.table reloadData];
}

-(void)createTableView
{
    self.table = [[UITableView alloc] initWithFrame:self.view.bounds
                                              style:UITableViewStylePlain];
    self.table.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.table.backgroundColor = [UIColor colorNamed:emplesGreenColor];
    [self.table setAutoresizingMask:UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth];
    [self.view addSubview:self.table];
    self.sourceManager = [[EmplesDetailTableViewManager alloc] init];
    self.table.dataSource = [self.sourceManager dataSourceForTableView:self.table];
    self.table.delegate = [self.sourceManager delegateForTableView:self.table];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
