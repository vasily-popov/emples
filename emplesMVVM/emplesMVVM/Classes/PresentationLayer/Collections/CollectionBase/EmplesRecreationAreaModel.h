//
//  EmplesRecreationArea.h
//  emplesVIPER
//
//  Created by Vasily Popov on 11/3/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EmplesRecreationAreaModel : NSObject

@property (nonatomic) Float32 longitude;
@property (nonatomic) Float32 latitude;
@property (strong, nonatomic) NSString* areaDescription;
@property (strong, nonatomic) NSString* areaDirections;
@property (strong, nonatomic) NSString* areaName;
@property (strong, nonatomic) NSString* areaPhone;
@property (strong, nonatomic) NSString* imageURL;

@end
