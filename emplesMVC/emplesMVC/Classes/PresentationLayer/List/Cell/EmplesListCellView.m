//
//  EmplesListCellView.m
//  emplesMVC
//
//  Created by Vasily Popov on 10/29/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

#import "EmplesListCellView.h"
#import "EmplesListCellModel.h"
#import <SDWebImage/UIImageView+WebCache.h>

@interface EmplesListCellView()

@property(nonatomic, weak) IBOutlet UILabel *titleLabel;
@property(nonatomic, weak) IBOutlet UILabel *phoneLabel;
@property(nonatomic, weak) IBOutlet UIImageView *iconView;

@property (strong, nonatomic) EmplesListCellModel *model;

@end

@implementation EmplesListCellView

- (void)configureWithModel:(id<ViewCellModelProtocol>)model
{
    if ([model isKindOfClass:[EmplesListCellModel class]])
    {
        self.model = (EmplesListCellModel *)model;
        self.titleLabel.text = self.model.text;
        self.titleLabel.font = self.model.font;
        self.titleLabel.textColor = self.model.textColor;
        self.phoneLabel.text = self.model.phone;
        self.phoneLabel.font = self.model.secondFont;
        self.phoneLabel.textColor = self.model.secondColor;
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

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
