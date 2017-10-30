//
//  UITableView+Reusable.m
//  emplesMVC
//
//  Created by Vasily Popov on 10/28/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

#import "UITableView+Reusable.h"

@implementation UITableView (Reusable)

-(void)registerCell:(Class<ReusableViewProtocol>) type
{
    [self registerClass:type forCellReuseIdentifier:[type defaultReuseIdentifier]];
}

-(void)registerCellNib:(Class<NibLoadableViewProtocol,ReusableViewProtocol>) type
{
    NSBundle *bundle = [NSBundle mainBundle];
    UINib *nib = [UINib nibWithNibName:[type nibName]
                                bundle:bundle];
    [self registerNib:nib forCellReuseIdentifier:[type defaultReuseIdentifier]];
}

@end
