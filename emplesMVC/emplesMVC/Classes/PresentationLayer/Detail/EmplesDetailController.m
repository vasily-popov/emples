//
//  EmplesDetailController.m
//  emplesMVC
//
//  Created by Vasily Popov on 10/30/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

#import "EmplesDetailController.h"
#import <GoogleMaps/GoogleMaps.h>
#define GOOGLE_MAPS_APIKEY @"AIzaSyBq67F_e2PQEWtKgCDDkHBpnVH1r383nQo"

@interface EmplesDetailController ()

@property (nonatomic, strong) EmplesDetailAreaModel *model;

@end

@implementation EmplesDetailController

-(instancetype)initWithModel:(EmplesDetailAreaModel*)model
{
    self = [super init];
    if (self) {
        self.model = model;
        [GMSServices provideAPIKey:GOOGLE_MAPS_APIKEY];
    }
    return self;
}

@end
