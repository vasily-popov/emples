//
//  EmplesDetailTableViewManager.m
//  emplesMVC
//
//  Created by Vasily Popov on 10/30/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

#import "EmplesDetailTableViewManager.h"
#import "EmplesDetailDirectionTextViewCell.h"
#import "EmplesDetailTextViewWithImageViewCell.h"
#import "EmplesDeatilMapViewCell.h"
#import "UITableView+Reusable.h"

@implementation EmplesDetailTableViewManager

-(void)registerCellsForTable:(UITableView*)tableView
{
    [tableView registerCellNib:EmplesDetailDirectionTextViewCell.class];
    [tableView registerCellNib:EmplesDetailTextViewWithImageViewCell.class];
    [tableView registerCell:EmplesDeatilMapViewCell.class];
}

@end
