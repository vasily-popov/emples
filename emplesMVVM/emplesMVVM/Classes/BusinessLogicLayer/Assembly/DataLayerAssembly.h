//
//  DataLayerAssembly.h
//  emplesMVP
//
//  Created by Vasily Popov on 11/1/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

#import <Typhoon/Typhoon.h>
@class DataFilePersistenceGateway;
@protocol DisplayAreaCollectionUseCase;

@interface DataLayerAssembly : TyphoonAssembly

- (id<DisplayAreaCollectionUseCase>)displayAreaCollectionUseCase;

@end
