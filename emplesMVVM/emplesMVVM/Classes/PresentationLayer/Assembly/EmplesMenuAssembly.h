//
//  EmplesMenuAssembly.h
//  emplesMVP
//
//  Created by Vasily Popov on 11/1/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

#import <Typhoon/Typhoon.h>
#import "ApplicationAssembly.h"
#import "EmplesMenuView.h"

@interface EmplesMenuAssembly : TyphoonAssembly

@property (nonatomic, strong, readonly) ApplicationAssembly *appAssembly;

- (EmplesMenuView*)menuView;


@end
