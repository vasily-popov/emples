//
//  EmplesStackedController.h
//  emplesMVC
//
//  Created by Vasily Popov on 10/31/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EmplesListViewModel.h"
#import "EmplesSwipeableViewDataSource.h"

@interface EmplesStackedViewModel : EmplesCollectionViewModel

@property (nonatomic, strong, readonly) EmplesSwipeableViewDataSource *dataSource;

@end
