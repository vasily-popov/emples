//
//  EmplesMenuModelDecorator.h
//  emplesMVC
//
//  Created by Vasily Popov on 10/29/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EmplesMenuModel.h"

@interface EmplesMenuModelDecorator : NSObject <DecoratorModelProtocol>

- (instancetype)init __unavailable;
- (instancetype)initWithModel:(EmplesMenuModel*)model NS_DESIGNATED_INITIALIZER;

@end
