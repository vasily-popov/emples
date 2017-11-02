//
//  EmplesDetailMapCellModel.h
//  emplesMVC
//
//  Created by Vasily Popov on 10/30/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ViewCellModelProtocol.h"
#import <CoreLocation/CoreLocation.h>

@interface EmplesDetailMapCellModel : NSObject<ViewCellModelProtocol>

@property (nonatomic) CLLocationCoordinate2D coordinate;

@end
