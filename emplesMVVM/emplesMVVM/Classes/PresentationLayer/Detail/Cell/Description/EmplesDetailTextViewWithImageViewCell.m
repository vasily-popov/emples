//
//  EmplesDetailTextViewWithImageViewCell.m
//  emplesMVC
//
//  Created by Vasily Popov on 10/30/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

#import "EmplesDetailTextViewWithImageViewCell.h"
#import "EmplesDetailDescriptionCellViewModel.h"
#import <SDWebImage/UIImageView+WebCache.h>

@interface EmplesDetailTextViewWithImageViewCell()

@property(nonatomic, weak) IBOutlet UITextView *textView;
@property(nonatomic, weak) IBOutlet UIImageView *iconView;

@property (strong, nonatomic) EmplesDetailDescriptionCellViewModel *viewModel;

@end

@implementation EmplesDetailTextViewWithImageViewCell

- (void)configureWithModel:(id<ViewCellModelProtocol>)viewModel
{
    if ([viewModel isKindOfClass:[EmplesDetailDescriptionCellViewModel class]])
    {
        self.viewModel = (EmplesDetailDescriptionCellViewModel *)viewModel;
    }
}

-(void)dealloc
{
    
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    RAC(self.textView, text) = RACObserve(self, viewModel.descriptionText);
    RAC(self.textView, font) = [RACObserve(self, viewModel.font) ignore:nil];
    RAC(self.textView, textColor) = [RACObserve(self, viewModel.textColor) ignore:nil];
    RAC(self.contentView, backgroundColor) = [RACObserve(self, viewModel.bgColor) ignore:nil];
    @weakify(self);
    [[[RACObserve(self, viewModel.imageURL) ignore:nil] distinctUntilChanged]
     subscribeNext:^(id _)
     {
         @strongify(self);
         [self.iconView sd_setImageWithURL:[NSURL URLWithString:self.viewModel.imageURL]];
     }];
}

@end
