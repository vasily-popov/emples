//
//  EmplesMenuRouter.m
//  emplesMVC
//
//  Created by Vasily Popov on 10/29/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

#import "EmplesMenuRouter.h"

@implementation EmplesMenuRouter

-(void)navigateToSelectedItem:(EnumMenuSelectedItem)item
{
    UIViewController<EmplesCollectionViewProtocol> *vc = [self.collectionsAssembly collectionViewFor:@(item)];
    [self.viewController pushViewController:vc animated:YES];
}

@end
