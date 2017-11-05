//
//  EmplesListCellModel.h
//  emplesMVC
//
//  Created by Vasily Popov on 10/29/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ViewCellModelProtocol.h"

@interface EmplesListCellViewModel : NSObject<ViewCellModelProtocol>

@property (nonatomic, strong) UIColor *bgColor;
@property (nonatomic, strong) UIFont *font;
@property (nonatomic, strong) UIColor *textColor;
@property (nonatomic, strong) NSString *text;
@property (nonatomic, strong) NSString *phone;
@property (nonatomic, strong) UIFont *secondFont;
@property (nonatomic, strong) UIColor *secondColor;
@property (nonatomic, strong) NSString *imageURL;


@end

