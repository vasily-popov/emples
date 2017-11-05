//
//  EmplesSwipeableViewDataSource.h
//  emplesMVVM
//
//  Created by Vasily Popov on 11/5/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GenericCollectionViewSourceProtocol.h"
#import <ZLSwipeableView/ZLSwipeableView.h>

@interface EmplesSwipeableViewDataSource : NSObject <GenericCollectionViewSourceProtocol, ZLSwipeableViewDataSource>

@end
