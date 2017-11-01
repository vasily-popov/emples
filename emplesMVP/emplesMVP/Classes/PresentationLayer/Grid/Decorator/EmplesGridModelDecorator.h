//
//  EmplesGridModelDecorator.h
//  emplesMVC
//
//  Created by Vasily Popov on 10/30/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EmplesAreasModel.h"

@interface EmplesGridModelDecorator : NSObject<DecoratorModelProtocol>

- (instancetype)init __unavailable;
- (instancetype)initWithModel:(EmplesAreasModel*)model NS_DESIGNATED_INITIALIZER;

@end
