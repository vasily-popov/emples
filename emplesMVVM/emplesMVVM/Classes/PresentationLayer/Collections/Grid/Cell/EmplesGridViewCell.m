//
//  EmplesGridViewCell.m
//  emplesMVC
//
//  Created by Vasily Popov on 10/30/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

#import "EmplesGridViewCell.h"
#import "EmplesGridCellViewModel.h"
#import <SDWebImage/UIImageView+WebCache.h>
@interface EmplesGridViewCell()

@property(nonatomic, weak) IBOutlet UILabel *titleLabel;
@property(nonatomic, weak) IBOutlet UIImageView *iconView;

@property (strong, nonatomic) EmplesGridCellViewModel *viewModel;

@end

@implementation EmplesGridViewCell

- (void)configureWithModel:(id<ViewCellModelProtocol>)viewModel
{
    if ([viewModel isKindOfClass:[EmplesGridCellViewModel class]])
    {
        self.viewModel = (EmplesGridCellViewModel *)viewModel;
    }
}

- (void)awakeFromNib {
    [super awakeFromNib];
    RAC(self.titleLabel, text) = RACObserve(self, viewModel.text);
    RAC(self.titleLabel, font) = RACObserve(self, viewModel.font);
    RAC(self.titleLabel, textColor) = RACObserve(self, viewModel.textColor);
    RAC(self.contentView, backgroundColor) = RACObserve(self, viewModel.bgColor);
    @weakify(self);
    [[[RACObserve(self, viewModel.imageURL) ignore:nil] distinctUntilChanged]
     subscribeNext:^(id _)
     {
         @strongify(self);
         [self.iconView sd_setImageWithURL:[NSURL URLWithString:self.viewModel.imageURL]];
     }];
}

@end
