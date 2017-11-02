//
//  ViewCellProtocol.h
//  emplesMVC
//
//  Created by Vasily Popov on 10/28/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

#import <Foundation/Foundation.h>
@protocol ViewCellModelProtocol;

@protocol ViewCellProtocol <NSObject>

- (void)configureWithModel:(id<ViewCellModelProtocol>)model;

@end

