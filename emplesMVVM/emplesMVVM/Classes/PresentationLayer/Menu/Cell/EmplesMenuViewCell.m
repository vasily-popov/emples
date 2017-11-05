//
//  EmplesMenuViewCell.m
//  emplesMVC
//
//  Created by Vasily Popov on 10/28/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

#import "EmplesMenuViewCell.h"
#import "EmplesMenuCellViewModel.h"

@interface EmplesMenuViewCell()

@property(nonatomic, weak) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) EmplesMenuCellViewModel *viewModel;

@end

@implementation EmplesMenuViewCell

- (void)configureWithModel:(id<ViewCellModelProtocol>)viewModel
{
    if ([viewModel isKindOfClass:[EmplesMenuCellViewModel class]])
    {
        self.viewModel = (EmplesMenuCellViewModel *)viewModel;
    }
}

- (void)awakeFromNib {
    [super awakeFromNib];
    RAC(self.titleLabel, text) = RACObserve(self, viewModel.text);
    RAC(self.titleLabel, font) = RACObserve(self, viewModel.font);
    RAC(self.titleLabel, textColor) = RACObserve(self, viewModel.textColor);
    RAC(self.contentView, backgroundColor) = RACObserve(self, viewModel.bgColor);
}

@end
