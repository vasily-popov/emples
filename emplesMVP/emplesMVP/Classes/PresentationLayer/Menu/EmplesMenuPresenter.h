//
//  EmplesMenuController.h
//  emplesMVC
//
//  Created by Vasily Popov on 10/28/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EmplesMenuModel.h"
#import "EmplesMenuView.h"
#import "EmplesMenuRouter.h"

@interface EmplesMenuPresenter : NSObject

@property (nonatomic, weak) id<EmplesMenuViewProtocol> view;
@property (nonatomic, strong) EmplesMenuRouter *router;

-(instancetype)init __unavailable;
-(instancetype)initWithModel:(EmplesMenuModel*)model NS_DESIGNATED_INITIALIZER;

-(void)viewDidLoad;

@end
