//
//  EmplesItemView.m
//  emplesMVC
//
//  Created by Vasily Popov on 10/31/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

#import "EmplesItemView.h"
#import "EmplesListCellModel.h"

#import <SDWebImage/UIImageView+WebCache.h>
@interface EmplesItemView()

@property(nonatomic, weak) IBOutlet UILabel *titleLabel;
@property(nonatomic, weak) IBOutlet UIImageView *iconView;

@property (strong, nonatomic) EmplesListCellModel *model;

@end

@implementation EmplesItemView

- (void)configureWithModel:(id<ViewCellModelProtocol>)model
{
    if ([model isKindOfClass:[EmplesListCellModel class]])
    {
        self.model = (EmplesListCellModel *)model;
        self.titleLabel.text = self.model.text;
        self.titleLabel.font = self.model.font;
        self.titleLabel.textColor = self.model.textColor;
        self.backgroundColor = self.model.bgColor;
        if (self.model.imageURL.length > 0)
        {
            [self.iconView sd_setImageWithURL:[NSURL URLWithString:self.model.imageURL]];
        }
    }
}

-(void)awakeFromNib
{
    [super awakeFromNib];
    self.layer.borderColor = [UIColor brownColor].CGColor;
    self.layer.borderWidth = 2;
    self.layer.cornerRadius = 10;
}

@end
