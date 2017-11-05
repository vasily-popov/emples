//
//  GenericTableViewDelegate.h
//  emplesMVVM
//
//  Created by Vasily Popov on 11/5/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

#import <Foundation/Foundation.h>
@class GenericTableViewSource;
@interface GenericTableViewDelegate : NSObject <UITableViewDelegate>

-(instancetype) initWithDataSource:(GenericTableViewSource*) dataSource;

@end
