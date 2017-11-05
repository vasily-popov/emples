//
//  EmplesDetailController.h
//  emplesMVC
//
//  Created by Vasily Popov on 10/30/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EmplesDetailView.h"
#import "EmplesRecreationAreaModel.h"

@protocol EmplesDetailViewModelProtocol

@property (nonatomic, strong, readonly) NSString *title;
@property (nonatomic, strong, readonly) id<UITableViewDataSource> dataSource;
@property (nonatomic, strong, readonly) id<UITableViewDelegate> delegate;

-(void)viewDidLoad;


@end

@interface EmplesDetailViewModel : NSObject <EmplesDetailViewModelProtocol>

-(instancetype)init __unavailable;
-(instancetype)initWithModel:(EmplesRecreationAreaModel*)model NS_DESIGNATED_INITIALIZER;

@end
