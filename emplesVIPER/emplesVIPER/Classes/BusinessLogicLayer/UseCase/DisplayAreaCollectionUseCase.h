//
//  DispalyAreaCollectionUseCase.h
//  emplesVIPER
//
//  Created by Vasily Popov on 11/3/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol DataAreaGatewayProtocol;
typedef void(^DisplayAreaResponseBlock)(NSArray* areas, NSError *error);

@protocol DisplayAreaCollectionUseCase <NSObject>

-(void)displayAreaCollection:(DisplayAreaResponseBlock) completionHandler;
-(instancetype)initWithGateway:(id<DataAreaGatewayProtocol>)gateway;

@end
