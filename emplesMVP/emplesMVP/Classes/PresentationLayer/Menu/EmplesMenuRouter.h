//
//  EmplesMenuRouter.h
//  emplesMVC
//
//  Created by Vasily Popov on 10/29/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

#import "BaseRouter.h"
#import "EnumMenuSelectedItem.h"

@interface EmplesMenuRouter : BaseRouter

-(void)navigateToSelectedItem:(EnumMenuSelectedItem)item;

@end
