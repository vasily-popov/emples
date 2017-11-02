//
//  EmplesListModelDecorator.h
//  emplesMVC
//
//  Created by Vasily Popov on 10/29/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EmplesAreasModel.h"

@interface EmplesListModelDecorator : NSObject<DecoratorModelProtocol>

- (instancetype)init __unavailable;
- (instancetype)initWithModel:(EmplesAreasModel*)model NS_DESIGNATED_INITIALIZER;

@end
