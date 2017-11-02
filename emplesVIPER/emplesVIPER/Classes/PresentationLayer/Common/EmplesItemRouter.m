//
//  EmplesItemRouter.m
//  emplesMVC
//
//  Created by Vasily Popov on 10/30/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

#import "EmplesItemRouter.h"
#import "EmplesDetailView.h"

@implementation EmplesItemRouter

-(void)navigateToItemDetail:(EmplesRecAreaJSONModel*)item
{
    EmplesDetailView *vc = [self.collectionsAssembly detailViewForModel:item];
    [self.viewController pushViewController:vc animated:YES];
}

@end
