//
//  EmplesDetailAreaModel.h
//  emplesMVC
//
//  Created by Vasily Popov on 10/30/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

#import <Foundation/Foundation.h>

@class EmplesRecreationAreaModel;
@interface EmplesDetailAreaModel : NSObject

- (instancetype)init __unavailable;
- (instancetype)initWithItem:(EmplesRecreationAreaModel*)area NS_DESIGNATED_INITIALIZER;

- (NSString*)titleName;
- (NSArray*)dataSource;

@end
