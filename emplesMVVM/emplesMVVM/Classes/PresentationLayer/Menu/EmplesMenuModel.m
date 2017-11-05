//
//  EmplesMenuModel.m
//  emplesMVC
//
//  Created by Vasily Popov on 10/28/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

#import "EmplesMenuModel.h"
#import "LocalizedStrings.h"
#import "NSString+Localizable.h"

@interface EmplesMenuModel()

@property (nonatomic, strong) NSArray *items;

@end

@implementation EmplesMenuModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self initializeModel];
    }
    return self;
}

-(void)initializeModel
{
    self.items = [NSArray arrayWithObjects:
                       [kListString localizedString],
                       [kGridString localizedString],
                       [kStackString localizedString],
                       [kGalleryString localizedString],
                       [kCarouselString localizedString],
                       nil];
}

@end
