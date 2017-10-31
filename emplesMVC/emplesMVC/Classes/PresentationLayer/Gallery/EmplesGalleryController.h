//
//  EmplesGalleryController.h
//  emplesMVC
//
//  Created by Vasily Popov on 10/31/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EmplesAreasModel.h"
#import "EmplesGalleryView.h"
#import "EmplesItemRouter.h"

@interface EmplesGalleryController : NSObject

@property (nonatomic, weak) EmplesGalleryView *view;
@property (nonatomic, strong) EmplesItemRouter *router;

-(instancetype)init __unavailable;
-(instancetype)initWithModel:(EmplesAreasModel*)model NS_DESIGNATED_INITIALIZER;

-(void)viewDidLoad;

@end

