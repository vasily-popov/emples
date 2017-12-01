//
//  DataAreaRequestClient.h
//  emplesMVC
//
//  Created by Vasily Popov on 10/28/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

#import "DataRequestProtocol.h"

@interface DataAreaRequestClient : NSObject

-(instancetype)initWithFactory:(id<DataRequestProtocol>)factory;

-(void) fetchAllAreas:(ContentResponseBlock)block;

@end
