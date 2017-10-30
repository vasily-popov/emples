//
//  EmplesDetailController.h
//  emplesMVC
//
//  Created by Vasily Popov on 10/30/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EmplesDetailView.h"
#import "EmplesDetailAreaModel.h"

@interface EmplesDetailController : NSObject

//router is not needed here
@property (nonatomic, weak) EmplesDetailView *view;

-(instancetype)init __unavailable;
-(instancetype)initWithModel:(EmplesDetailAreaModel*)model NS_DESIGNATED_INITIALIZER;

@end
