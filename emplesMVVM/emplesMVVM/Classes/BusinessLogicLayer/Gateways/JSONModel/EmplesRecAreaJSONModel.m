//
//  EmplesRecAreaJSONModel.m
//  emplesMVC
//
//  Created by Vasily Popov on 10/28/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

#import "EmplesRecAreaJSONModel.h"
#import "EmplesRecreationAreaModel.h"
@implementation EmplesRecAreaJSONModel


-(EmplesRecreationAreaModel*)ponsoObject
{
    EmplesRecreationAreaModel *area = [EmplesRecreationAreaModel new];
    area.longitude = self.RecAreaLongitude;
    area.latitude = self.RecAreaLatitude;
    area.areaDescription = [self.RecAreaDescription copy];
    area.areaDirections = [self.RecAreaDirections copy];
    area.areaName = [self.RecAreaName copy];
    area.imageURL = [self.imageURL copy];
    area.areaPhone = [self.RecAreaPhone copy];
    return area;
}

@end
