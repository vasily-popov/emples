//
//  EmplesGridController.h
//  emplesMVC
//
//  Created by Vasily Popov on 10/30/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EmplesAreasModel.h"
#import "EmplesGridView.h"
#import "EmplesItemRouter.h"

@interface EmplesGridController : NSObject

@property (nonatomic, weak) EmplesGridView *view;
@property (nonatomic, strong) EmplesItemRouter *router;

-(instancetype)init __unavailable;
-(instancetype)initWithModel:(EmplesAreasModel*)model NS_DESIGNATED_INITIALIZER;

-(void)viewDidLoad;

@end
