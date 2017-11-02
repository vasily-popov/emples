//
//  DecoratorModelProtocol.h
//  emplesMVC
//
//  Created by Vasily Popov on 10/30/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol DecoratorModelProtocol <NSObject>

@property (nonatomic, strong, readonly) NSArray *dataSource;

@end

