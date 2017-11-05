//
//  EmplesDetailAreaModel.m
//  emplesMVC
//
//  Created by Vasily Popov on 10/30/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

#import "EmplesDetailAreaModel.h"
#import "EmplesRecreationAreaModel.h"
#import "EmplesDetailDirectionsCellModel.h"
#import "EmplesDetailMapCellModel.h"
#import "EmplesDetailDescriptionCellModel.h"
#import "DataSourceItem.h"

@interface EmplesDetailAreaModel()
@property (nonatomic, strong) EmplesRecreationAreaModel* area;
@end

@implementation EmplesDetailAreaModel

- (instancetype)initWithItem:(EmplesRecreationAreaModel*)area
{
    self = [super init];
    if (self)
    {
        self.area = area;
    }
    return self;
}

-(void)dealloc
{
    
}

@end
