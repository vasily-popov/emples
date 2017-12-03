//
//  EmplesDetailTextViewWithImageViewCell.m
//  emplesMVC
//
//  Created by Vasily Popov on 10/30/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

#import "EmplesDetailTextViewWithImageViewCell.h"
#import "EmplesDetailDescriptionCellModel.h"
#import <SDWebImage/UIImageView+WebCache.h>

@interface EmplesDetailTextViewWithImageViewCell()

@property(nonatomic, weak) IBOutlet UITextView *textView;
@property(nonatomic, weak) IBOutlet UIImageView *iconView;

@property (strong, nonatomic) EmplesDetailDescriptionCellModel *model;

@end

@implementation EmplesDetailTextViewWithImageViewCell

- (void)configureWithModel:(id<ViewCellModelProtocol>)model
{
    if ([model isKindOfClass:[EmplesDetailDescriptionCellModel class]])
    {
        self.model = (EmplesDetailDescriptionCellModel *)model;
        self.textView.text = self.model.descriptionText;
        self.textView.font = self.model.font;
        self.textView.textColor = self.model.textColor;
        self.contentView.backgroundColor = self.model.bgColor;
        if (self.model.imageURL.length > 0)
        {
            [self.iconView sd_setImageWithURL:[NSURL URLWithString:self.model.imageURL]];
        }
    }
}

@end
