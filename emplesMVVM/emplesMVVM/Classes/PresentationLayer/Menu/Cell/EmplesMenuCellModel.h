//
//  EmplesMenuCellModel.h
//  emplesMVC
//
//  Created by Vasily Popov on 10/28/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ViewCellModelProtocol.h"

@interface EmplesMenuCellModel : NSObject<ViewCellModelProtocol>

@property (nonatomic, strong) UIColor *bgColor;
@property (nonatomic, strong) UIFont *font;
@property (nonatomic, strong) NSString *text;
@property (nonatomic, strong) UIColor *textColor;


@end
