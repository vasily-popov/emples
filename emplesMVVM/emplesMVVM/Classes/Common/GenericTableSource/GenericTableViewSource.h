//
//  GenericDataSource.h
//  emplesMVC
//
//  Created by Vasily Popov on 10/28/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GenericCollectionViewSourceProtocol.h"

@interface GenericTableViewSource : NSObject <GenericCollectionViewSourceProtocol,UITableViewDataSource>

@end

