//
//  EmplesGridViewCell.m
//  emplesMVC
//
//  Created by Vasily Popov on 10/30/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

#import "EmplesGridViewCell.h"
#import "EmplesGridCellModel.h"
#import <SDWebImage/UIImageView+WebCache.h>
@interface EmplesGridViewCell()

@property(nonatomic, weak) IBOutlet UILabel *titleLabel;
@property(nonatomic, weak) IBOutlet UIImageView *iconView;

@property (strong, nonatomic) EmplesGridCellModel *model;

@end

@implementation EmplesGridViewCell

- (void)configureWithModel:(id<ViewCellModelProtocol>)model
{
    if ([model isKindOfClass:[EmplesGridCellModel class]])
    {
        self.model = (EmplesGridCellModel *)model;
        self.titleLabel.text = self.model.text;
        self.titleLabel.font = self.model.font;
        self.titleLabel.textColor = self.model.textColor;
        self.contentView.backgroundColor = self.model.bgColor;
        if (self.model.imageURL.length > 0)
        {
            [self.iconView sd_setImageWithURL:[NSURL URLWithString:self.model.imageURL]];
        }
    }
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

@end
