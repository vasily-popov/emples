//
//  EmplesMenuTableViewManager.m
//  emplesMVC
//
//  Created by Vasily Popov on 10/29/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

#import "EmplesMenuTableViewManager.h"
#import "EmplesMenuViewCell.h"
#import "UITableView+Reusable.h"


@implementation EmplesMenuTableViewManager

-(void)registerCellsForTable:(UITableView*)tableView
{
    [tableView registerCellNib:EmplesMenuViewCell.class];
}

@end
