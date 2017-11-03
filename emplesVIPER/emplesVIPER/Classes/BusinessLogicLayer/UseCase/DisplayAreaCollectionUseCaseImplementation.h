//
//  DisplayAreasCollectionUseCase.h
//  emplesVIPER
//
//  Created by Vasily Popov on 11/3/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DataAreaGatewayProtocol.h"
#import "DisplayAreaCollectionUseCase.h"

@interface DisplayAreaCollectionUseCaseImplementation : NSObject <DisplayAreaCollectionUseCase>

-(instancetype)init __unavailable;
-(instancetype)initWithGateway:(id<DataAreaGatewayProtocol>)gateway NS_DESIGNATED_INITIALIZER;

@end
