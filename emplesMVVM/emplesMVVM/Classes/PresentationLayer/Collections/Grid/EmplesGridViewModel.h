//
//  EmplesGridController.h
//  emplesMVC
//
//  Created by Vasily Popov on 10/30/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EmplesCollectionViewModel.h"
#import "GenericCollectionViewDelegate.h"
#import "GenericGridViewSource.h"

@interface EmplesGridViewModel : EmplesCollectionViewModel

@property (nonatomic, strong, readonly) GenericGridViewSource *dataSource;
@property (nonatomic, strong, readonly) GenericCollectionViewDelegate *delegate;

@end
