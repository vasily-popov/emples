//
//  EmplesAreaModel.m
//  emplesMVC
//
//  Created by Vasily Popov on 10/29/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

#import "EmplesAreasModel.h"
#import "DataAreaRequestClient.h"

@class EmplesRecAreaJSONModel;

@interface EmplesAreasModel()

@property (nonatomic, strong) NSArray *dataSource;
@property (nonatomic, strong) DataAreaRequestClient* client;

@end

@implementation EmplesAreasModel

- (instancetype)initWithClient:(DataAreaRequestClient*)client
{
    self = [super init];
    if (self)
    {
        self.client = client;
    }
    return self;
}

-(void)dealloc
{
    
}

-(void)fetchAreas
{
    __weak typeof(self) weakSelf = self;
    [self.client fetchAllAreas:^(NSArray<EmplesRecAreaJSONModel*>* response, NSError *error)
    {
        __strong typeof(self) strongSelf = weakSelf;
        if(strongSelf)
        {
            if(error)
            {
                [strongSelf.delegate areasModel:strongSelf didFinishWithError:error];
            }
            else
            {
                strongSelf.dataSource = response;
                [strongSelf.delegate areasModel:strongSelf didFinishWithResponse:response];
            }
        }
    }];
}

@end
