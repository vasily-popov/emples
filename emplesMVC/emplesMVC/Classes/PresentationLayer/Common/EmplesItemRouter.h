//
//  EmplesItemRouter.h
//  emplesMVC
//
//  Created by Vasily Popov on 10/30/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

#import "BaseRouter.h"

@class EmplesRecAreaJSONModel;
@interface EmplesItemRouter : BaseRouter

-(void)navigateToItemDetail:(EmplesRecAreaJSONModel*)item;

@end
