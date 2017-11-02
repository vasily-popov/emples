//
//  EmplesDetailAreaModel.h
//  emplesMVC
//
//  Created by Vasily Popov on 10/30/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DecoratorModelProtocol.h"

@class EmplesRecAreaJSONModel;
@interface EmplesDetailAreaModel : NSObject <DecoratorModelProtocol>

- (instancetype)init __unavailable;
- (instancetype)initWithItem:(EmplesRecAreaJSONModel*)model NS_DESIGNATED_INITIALIZER;

- (NSString*)titleName;

@end
