//
//  DataAreaRequestClient.m
//  emplesMVC
//
//  Created by Vasily Popov on 10/28/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

#import "DataFilePersistenceGateway.h"
#import "EmplesRecAreaJSONModel.h"

@interface DataFilePersistenceGateway()

@property (nonatomic, strong) id<FileReaderClientProtocol> readerClient;

@end

@implementation DataFilePersistenceGateway

-(instancetype)initWithClient:(id<FileReaderClientProtocol>)readerClient
{
    self = [super init];
    if (self) {
        self.readerClient = readerClient;
    }
    return self;
}

-(void) fetchAllAreas:(ContentResponseBlock)block
{
    __weak typeof(self) weakSelf = self;
    [self.readerClient readAllArea:^(id response, NSError *error)
    {
        __strong typeof(self) strongSelf = weakSelf;
        if(strongSelf)
        {
            if(!error)
            {
                NSError *parseError = nil;
                NSArray *model = [strongSelf parseAreaResponse:response error:&parseError];
                block(model, parseError);
            }
            else
            {
                block(nil, error);
            }
        }
    }];
}

-(NSArray* ) parseAreaResponse:(id)response error:(NSError**)error
{
    NSArray<EmplesRecAreaJSONModel*>* model = nil;
    if ([response isKindOfClass:[NSArray class]])
    {
        model = [EmplesRecAreaJSONModel arrayOfModelsFromDictionaries:response error:error];
    }
    
    return model;
}


@end
