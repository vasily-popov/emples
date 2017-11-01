//
//  EmplesItemRouter.h
//  emplesMVC
//
//  Created by Vasily Popov on 10/30/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

#import "BaseRouter.h"
#import "EmplesCollectionsAssembly.h"

@class EmplesRecAreaJSONModel;
@interface EmplesItemRouter : BaseRouter

@property (nonatomic, strong) EmplesCollectionsAssembly *collectionsAssembly;

-(void)navigateToItemDetail:(EmplesRecAreaJSONModel*)item;

@end
