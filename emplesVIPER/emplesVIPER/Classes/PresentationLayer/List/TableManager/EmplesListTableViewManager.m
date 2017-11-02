//
//  EmplesListTableViewManager.m
//  emplesMVC
//
//  Created by Vasily Popov on 10/29/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

#import "EmplesListTableViewManager.h"
#import "UITableView+Reusable.h"
#import "EmplesListCellView.h"

@implementation EmplesListTableViewManager

-(void)registerCellsForTable:(UITableView*)tableView
{
    [tableView registerCellNib:EmplesListCellView.class];
}

@end
