//
//  EmplesDetailDirectionTextViewCell.m
//  emplesMVC
//
//  Created by Vasily Popov on 10/30/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

#import "EmplesDetailDirectionTextViewCell.h"
#import "EmplesDetailDirectionsCellModel.h"

@interface EmplesDetailDirectionTextViewCell()

@property(nonatomic, weak) IBOutlet UITextView *textView;

@property (strong, nonatomic) EmplesDetailDirectionsCellModel *model;

@end

@implementation EmplesDetailDirectionTextViewCell

- (void)configureWithModel:(id<ViewCellModelProtocol>)model
{
    if ([model isKindOfClass:[EmplesDetailDirectionsCellModel class]])
    {
        self.model = (EmplesDetailDirectionsCellModel *)model;
        self.textView.text = self.model.directionText;
        self.textView.font = self.model.font;
        self.textView.textColor = self.model.textColor;
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
