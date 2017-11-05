//
//  EmplesDetailDirectionTextViewCell.m
//  emplesMVC
//
//  Created by Vasily Popov on 10/30/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

#import "EmplesDetailDirectionTextViewCell.h"
#import "EmplesDetailDirectionsCellViewModel.h"

@interface EmplesDetailDirectionTextViewCell()

@property(nonatomic, weak) IBOutlet UITextView *textView;

@property (strong, nonatomic) EmplesDetailDirectionsCellViewModel *viewModel;

@end

@implementation EmplesDetailDirectionTextViewCell

- (void)configureWithModel:(id<ViewCellModelProtocol>)viewModel
{
    if ([viewModel isKindOfClass:[EmplesDetailDirectionsCellViewModel class]])
    {
        self.viewModel = (EmplesDetailDirectionsCellViewModel *)viewModel;
    }
}

-(void)dealloc
{
    
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    RAC(self.textView, text) = RACObserve(self, viewModel.directionText);
    RAC(self.textView, font) = [RACObserve(self, viewModel.font) ignore:nil];
    RAC(self.textView, textColor) = [RACObserve(self, viewModel.textColor) ignore:nil];
    RAC(self.contentView, backgroundColor) = [RACObserve(self, viewModel.bgColor) ignore:nil];
}

@end
