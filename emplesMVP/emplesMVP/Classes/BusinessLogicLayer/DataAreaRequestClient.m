//
//  DataAreaRequestClient.m
//  emplesMVC
//
//  Created by Vasily Popov on 10/28/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

#import "DataAreaRequestClient.h"
#import "EmplesRecAreaJSONModel.h"
#import "EmplesFileNames.h"

@interface DataAreaRequestClient()

@property (nonatomic, strong) id<DataRequestProtocol> factory;

@end

@implementation DataAreaRequestClient

-(instancetype)initWithFactory:(id<DataRequestProtocol>)factory
{
    self = [super init];
    if (self) {
        self.factory = factory;
    }
    return self;
}

-(void) fetchAllAreas:(ContentResponseBlock)block
{
    __weak typeof(self) weakSelf = self;
    [self.factory requestToRead:kRecAreaFileName withResponseBlock:^(id response, NSError *error)
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
