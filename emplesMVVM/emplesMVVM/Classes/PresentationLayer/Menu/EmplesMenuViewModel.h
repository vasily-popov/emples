//
//  EmplesMenuViewModel.h
//  emplesMVVM
//
//  Created by Vasily Popov on 11/3/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EmplesMenuRouter.h"

@class EmplesMenuModel;
@protocol EmplesMenuViewModelProtocol

@property (nonatomic, strong, readonly) NSString* title;
@property (nonatomic, strong, readonly) id<UITableViewDataSource> dataSource;
@property (nonatomic, strong, readonly) id<UITableViewDelegate> delegate;

-(void)viewDidLoad;

@end

@interface EmplesMenuViewModel : NSObject <EmplesMenuViewModelProtocol>

-(instancetype)init __unavailable;
-(instancetype)initWithModel:(EmplesMenuModel*)model NS_DESIGNATED_INITIALIZER;

@property (nonatomic, strong) EmplesMenuRouter *router;

@end

