//
//  EmplesRecAreaJSONModel.h
//  emplesMVC
//
//  Created by Vasily Popov on 10/28/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

#import <JSONModel/JSONModel.h>
@class EmplesRecreationArea;

@interface EmplesRecAreaJSONModel : JSONModel

@property (strong, nonatomic) NSString* OrgRecAreaID;
@property (strong, nonatomic) NSString* LastUpdatedDate;
@property (strong, nonatomic) NSString* RecAreaEmail;
@property (strong, nonatomic) NSString* RecAreaReservationURL;
@property (nonatomic) Float32 RecAreaLongitude;
@property (nonatomic) NSInteger RecAreaID;
@property (strong, nonatomic) NSString* RecAreaPhone;
@property (strong, nonatomic) NSString* RecAreaDescription;
@property (strong, nonatomic) NSString* RecAreaMapURL;
@property (nonatomic) Float32 RecAreaLatitude;
@property (strong, nonatomic) NSString* StayLimit;
@property (strong, nonatomic) NSString* RecAreaFeeDescription;
@property (strong, nonatomic) NSString* RecAreaDirections;
@property (strong, nonatomic) NSString* Keywords;
@property (strong, nonatomic) NSString* RecAreaName;
@property (strong, nonatomic) NSString* imageURL;


-(EmplesRecreationArea*)ponsoObject;

@end

