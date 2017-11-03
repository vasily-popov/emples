//
//  DisplayAreasCollectionUseCase.m
//  emplesVIPER
//
//  Created by Vasily Popov on 11/3/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

#import "DisplayAreaCollectionUseCaseImplementation.h"
#import "EmplesRecAreaJSONModel.h"
#import "EmplesRecreationArea.h"

@interface DisplayAreaCollectionUseCaseImplementation()

@property (nonatomic, strong) id<DataAreaGatewayProtocol> gateway;

@end

@implementation DisplayAreaCollectionUseCaseImplementation

-(instancetype)initWithGateway:(id<DataAreaGatewayProtocol>)gateway
{
    self = [super init];
    if(self)
    {
        self.gateway = gateway;
    }
    return self;
}

-(void)displayAreaCollection:(DisplayAreaResponseBlock) completionHandler
{
    [self.gateway fetchAllAreas:^(id response, NSError *error)
    {
        if(!error && [response isKindOfClass:[NSArray class]])
        {
            NSArray *array = [self processArray:(NSArray*)response];
            completionHandler(array, nil);
        }
        else
        {
            completionHandler(nil, error);
        }
    }];
}

-(NSArray*)processArray:(NSArray<EmplesRecAreaJSONModel*>*)array
{
    NSMutableArray *resultArray = [NSMutableArray array];
    for (EmplesRecAreaJSONModel* item in array)
    {
        EmplesRecreationArea *area = [item ponsoObject];
        [resultArray addObject:area];
    }
    return resultArray;
}

@end
