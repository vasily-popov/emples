//
//  DataSourceItem.h
//  emplesMVC
//
//  Created by Vasily Popov on 10/28/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ViewCellModelProtocol.h"

@interface DataSourceItem : NSObject

@property (strong, nonatomic) id<ViewCellModelProtocol> cellModel;
@property (strong, nonatomic, readonly) id value;
@property (assign, nonatomic) float rowHeight;
@property (strong, nonatomic) RACCommand *command;

- (instancetype)initWithCellModel:(id<ViewCellModelProtocol>)cellModel;

@end
