//
//  GenericTableViewManager.h
//  emplesMVC
//
//  Created by Vasily Popov on 10/28/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol UITableSourceManager <NSObject>

- (instancetype)initWithSource:(NSArray*)source;
- (void)updateDataSource:(NSArray*)source;
- (void)appendItems:(NSArray*)items;
- (id<UITableViewDataSource>)dataSourceForTableView:(UITableView *)tableView;
- (id<UITableViewDelegate>)delegateForTableView:(UITableView *)tableView;

@end

@interface GenericTableViewManager : NSObject<UITableSourceManager>

@end
