//
//  EmplesCarouselController.h
//  emplesMVC
//
//  Created by Vasily Popov on 10/31/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EmplesCollectionViewModel.h"
#import "EmplesCarouselDataSource.h"
#import "EmplesCarouselDelegate.h"

@interface EmplesCarouselViewModel : EmplesCollectionViewModel

@property (nonatomic, strong, readonly) EmplesCarouselDataSource *dataSource;
@property (nonatomic, strong, readonly) EmplesCarouselDelegate *delegate;

@end
