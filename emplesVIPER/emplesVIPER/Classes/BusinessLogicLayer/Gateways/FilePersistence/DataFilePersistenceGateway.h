//
//  DataAreaRequestClient.h
//  emplesMVC
//
//  Created by Vasily Popov on 10/28/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

#import "FileReaderClientProtocol.h"
#import "DataAreaGatewayProtocol.h"

@interface DataFilePersistenceGateway : NSObject <DataAreaGatewayProtocol>

-(instancetype)initWithClient:(id<FileReaderClientProtocol>)readerClient;

@end
