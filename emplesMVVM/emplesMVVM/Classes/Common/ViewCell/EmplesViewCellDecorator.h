//
//  EmplesViewCellDecorator.h
//  emplesVIPER
//
//  Created by Vasily Popov on 11/3/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ViewCellModelProtocol.h"

@interface EmplesViewCellDecorator : NSProxy

@property (nonatomic, strong) id ponsoModel;
@property (nonatomic, strong) NSObject<ViewCellModelProtocol> *instance;
+(instancetype) decoratedInstanceOf:(NSObject<ViewCellModelProtocol> *)instance;

@end
