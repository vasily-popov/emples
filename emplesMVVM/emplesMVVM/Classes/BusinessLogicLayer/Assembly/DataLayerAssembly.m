//
//  DataLayerAssembly.m
//  emplesMVP
//
//  Created by Vasily Popov on 11/1/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

#import "DataLayerAssembly.h"
#import "DataFilePersistenceGateway.h"
#import "JsonFileReader.h"
#import "DisplayAreaCollectionUseCaseImplementation.h"

@implementation DataLayerAssembly

- (DataFilePersistenceGateway*)gateway
{
    return [TyphoonDefinition withClass:[DataFilePersistenceGateway class]
                          configuration:^(TyphoonDefinition* definition)
            {
                [definition useInitializer:@selector(initWithClient:) parameters:^(TyphoonMethod *initializer)
                 {
                     [initializer injectParameterWith:[self fileReader]];
                 }];
                definition.scope = TyphoonScopeSingleton;
            }];
}

- (id<DisplayAreaCollectionUseCase>)displayAreaCollectionUseCase
{
    return [TyphoonDefinition withClass:[DisplayAreaCollectionUseCaseImplementation class]
                          configuration:^(TyphoonDefinition* definition)
            {
                [definition useInitializer:@selector(initWithGateway:) parameters:^(TyphoonMethod *initializer)
                 {
                     [initializer injectParameterWith:[self gateway]];
                 }];
            }];
}

-(id<FileReaderClientProtocol>)fileReader
{
    return [TyphoonDefinition withClass:[JsonFileReader class]
                          configuration:^(TyphoonDefinition *definition)
    {
    }];
    
}
@end
