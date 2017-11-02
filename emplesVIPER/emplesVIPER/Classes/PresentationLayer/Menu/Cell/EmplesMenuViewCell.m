//
//  EmplesMenuViewCell.m
//  emplesMVC
//
//  Created by Vasily Popov on 10/28/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

#import "EmplesMenuViewCell.h"
#import "EmplesMenuCellModel.h"

@interface EmplesMenuViewCell()

@property(nonatomic, weak) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) EmplesMenuCellModel *model;

@end

@implementation EmplesMenuViewCell

- (void)configureWithModel:(id<ViewCellModelProtocol>)model
{
    if ([model isKindOfClass:[EmplesMenuCellModel class]])
    {
        self.model = (EmplesMenuCellModel *)model;
        self.titleLabel.text = self.model.text;
        self.titleLabel.font = self.model.font;
        self.titleLabel.textColor = self.model.textColor;
        self.contentView.backgroundColor = self.model.bgColor;
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
