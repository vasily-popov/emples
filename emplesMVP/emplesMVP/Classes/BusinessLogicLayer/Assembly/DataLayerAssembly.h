//
//  DataLayerAssembly.h
//  emplesMVP
//
//  Created by Vasily Popov on 11/1/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

#import <Typhoon/Typhoon.h>
@class DataAreaRequestClient;

@interface DataLayerAssembly : TyphoonAssembly

- (DataAreaRequestClient*)client;

@end
