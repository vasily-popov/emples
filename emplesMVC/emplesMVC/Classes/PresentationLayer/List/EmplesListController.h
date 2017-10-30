//
//  EmplesListController.h
//  emplesMVC
//
//  Created by Vasily Popov on 10/29/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EmplesAreasModel.h"
#import "EmplesListView.h"
#import "EmplesItemRouter.h"

@interface EmplesListController : NSObject

@property (nonatomic, weak) EmplesListView *view;
@property (nonatomic, strong) EmplesItemRouter *router;

-(instancetype)init __unavailable;
-(instancetype)initWithModel:(EmplesAreasModel*)model NS_DESIGNATED_INITIALIZER;

-(void)viewDidLoad;
@end
