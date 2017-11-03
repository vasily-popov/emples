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

#import "EmplesMenuCellModel.h"
#import "DataSourceItem.h"
#import "EnumMenuSelectedItem.h"

@interface EmplesMenuModel()

@property (nonatomic, strong) NSArray *source;

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
    self.source = [NSArray arrayWithObjects:
                       [kListString localizedString],
                       [kGridString localizedString],
                       [kStackString localizedString],
                       [kGalleryString localizedString],
                       [kCarouselString localizedString],
                       nil];
}

-(NSArray*)buildSourceModel
{
    __weak typeof(self) weakSelf = self;
    NSMutableArray *sourseItems = [NSMutableArray arrayWithCapacity:self.source.count];
    for (int index = 0; index < self.source.count; index ++)
    {
        NSString *item = self.source[index];
        EmplesMenuCellModel *model = [EmplesMenuCellModel new];
        model.text = item;
        DataSourceItem *row = [[DataSourceItem alloc] initWithCellModel:model];
        row.rowHeight = 50;
        row.selectAction = ^(EmplesMenuCellModel *cellModel)
        {
            __strong typeof(self) strongSelf = weakSelf;
            if(strongSelf.delegate)
            {
                EnumMenuSelectedItem selectedIndex = index;
                [strongSelf.delegate selectedItem:selectedIndex];
            }
        };
        [sourseItems addObject:row];
    }
    return sourseItems;
}


@end
