//
//  EmplesListController.h
//  emplesMVC
//
//  Created by Vasily Popov on 10/29/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EmplesCollectionViewModel.h"

@interface EmplesListViewModel : EmplesCollectionViewModel

@property (nonatomic, strong, readonly) GenericTableViewSource *dataSource;
@property (nonatomic, strong, readonly) GenericTableViewDelegate *delegate;

@end
