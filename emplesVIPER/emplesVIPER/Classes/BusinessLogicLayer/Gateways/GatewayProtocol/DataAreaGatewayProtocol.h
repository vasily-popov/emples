//
//  DataAreaGatewayProtocol.h
//  emplesVIPER
//
//  Created by Vasily Popov on 11/3/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^DataAreaGatewayResponseBlock)(id response, NSError *error);

@protocol DataAreaGatewayProtocol <NSObject>

-(void) fetchAllAreas:(DataAreaGatewayResponseBlock)block;

@end
