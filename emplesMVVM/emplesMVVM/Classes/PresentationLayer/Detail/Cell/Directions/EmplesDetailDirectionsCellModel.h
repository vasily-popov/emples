//
//  EmplesDetailDirectionsCellModel.h
//  emplesMVC
//
//  Created by Vasily Popov on 10/30/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ViewCellModelProtocol.h"

@interface EmplesDetailDirectionsCellModel : NSObject<ViewCellModelProtocol>

@property (nonatomic, strong) UIColor *bgColor;
@property (nonatomic, strong) UIFont *font;
@property (nonatomic, strong) UIColor *textColor;
@property (nonatomic, strong) NSString *directionText;


@end

