//
//  DataLayerAssembly.m
//  emplesMVP
//
//  Created by Vasily Popov on 11/1/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

#import "DataLayerAssembly.h"
#import "DataAreaRequestClient.h"
#import "EmplesFSJsonReader.h"

@implementation DataLayerAssembly

- (DataAreaRequestClient*)client
{
    return [TyphoonDefinition withClass:[DataAreaRequestClient class]
                          configuration:^(TyphoonDefinition* definition)
            {
                [definition useInitializer:@selector(initWithFactory:) parameters:^(TyphoonMethod *initializer)
                 {
                     [initializer injectParameterWith:[self dataRequestFactory]];
                 }];
                definition.scope = TyphoonScopeLazySingleton;
            }];
}

-(id<DataRequestProtocol>)dataRequestFactory
{
    return [TyphoonDefinition withClass:[EmplesFSJsonReader class]
                          configuration:^(TyphoonDefinition *definition)
    {
        definition.scope = TyphoonScopeLazySingleton;
    }];
    
}
@end
