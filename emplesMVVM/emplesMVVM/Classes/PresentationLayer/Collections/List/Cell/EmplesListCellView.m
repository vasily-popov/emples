//
//  EmplesListCellView.m
//  emplesMVC
//
//  Created by Vasily Popov on 10/29/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

#import "EmplesListCellView.h"
#import "EmplesListCellViewModel.h"
#import <SDWebImage/UIImageView+WebCache.h>

@interface EmplesListCellView()

@property(nonatomic, weak) IBOutlet UILabel *titleLabel;
@property(nonatomic, weak) IBOutlet UILabel *phoneLabel;
@property(nonatomic, weak) IBOutlet UIImageView *iconView;

@property (strong, nonatomic) EmplesListCellViewModel *viewModel;

@end

@implementation EmplesListCellView

- (void)configureWithModel:(id<ViewCellModelProtocol>)viewModel
{
    if ([viewModel isKindOfClass:[EmplesListCellViewModel class]])
    {
        self.viewModel = (EmplesListCellViewModel *)viewModel;
    }
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    RAC(self.titleLabel, text) = RACObserve(self, viewModel.text);
    RAC(self.titleLabel, font) = RACObserve(self, viewModel.font);
    RAC(self.titleLabel, textColor) = RACObserve(self, viewModel.textColor);
    RAC(self.phoneLabel, text) = RACObserve(self, viewModel.phone);
    RAC(self.phoneLabel, font) = RACObserve(self, viewModel.secondFont);
    RAC(self.phoneLabel, textColor) = RACObserve(self, viewModel.secondColor);
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
