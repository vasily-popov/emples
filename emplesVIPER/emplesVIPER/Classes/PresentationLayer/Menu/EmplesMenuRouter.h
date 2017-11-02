//
//  EmplesMenuRouter.h
//  emplesMVC
//
//  Created by Vasily Popov on 10/29/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

#import "BaseRouter.h"
#import "EnumMenuSelectedItem.h"
#import "EmplesCollectionsAssembly.h"
@interface EmplesMenuRouter : BaseRouter

@property (nonatomic, strong) EmplesCollectionsAssembly *collectionsAssembly;

-(void)navigateToSelectedItem:(EnumMenuSelectedItem)item;

@end
