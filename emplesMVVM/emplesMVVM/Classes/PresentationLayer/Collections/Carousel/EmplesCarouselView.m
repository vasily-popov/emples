//
//  EmplesCaruselView.m
//  emplesMVC
//
//  Created by Vasily Popov on 10/28/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

#import "EmplesCarouselView.h"
#import "ColorStrings.h"
#import <iCarousel/iCarousel.h>

@interface EmplesCarouselView ()

@property (strong, nonatomic) iCarousel *carousel;

@end

@implementation EmplesCarouselView

@synthesize viewModel;

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor: [UIColor colorNamed:emplesGreenColor]];
    [self bindViewModel];
    [self.viewModel viewDidLoad];
}

-(void)bindViewModel
{
    RAC(self, title) = RACObserve(self, viewModel.title);
    RAC(self.carousel, dataSource) = RACObserve(self, viewModel.dataSource);
    RAC(self.carousel, delegate) = RACObserve(self, viewModel.delegate);
    
    @weakify(self);
    [[[RACObserve(self.viewModel.dataSource, source) ignore:nil] distinctUntilChanged]
     subscribeNext:^(id _)
     {
         @strongify(self);
         [self.carousel reloadData];
     }];
    
    [[[self.viewModel.loadItemsAction.executing skipWhileBlock:^ BOOL (NSNumber *loading)
    {
        // Skip until we start loading.
        return !loading.boolValue;
    }] distinctUntilChanged]
     subscribeNext:^(NSNumber *loading) {
         @strongify(self);
         if (loading.boolValue) {
             [self showProgressView];
         } else {
             [self hideProgressView];
         }
     }];
}

-(iCarousel*)carousel
{
    if(!_carousel)
    {
        _carousel = [[iCarousel alloc] initWithFrame:self.view.bounds];
        _carousel.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        _carousel.type = iCarouselTypeCoverFlow2;
        //add carousel to view
        [self.view addSubview:_carousel];
    }
    return _carousel;
}

@end
