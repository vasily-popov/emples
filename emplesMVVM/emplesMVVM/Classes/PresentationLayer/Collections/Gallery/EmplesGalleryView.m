//
//  EmplesGalleryView.m
//  emplesMVC
//
//  Created by Vasily Popov on 10/28/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

#import "EmplesGalleryView.h"
#import "EmplesCollectionViewModel.h"
#import "ColorStrings.h"
#import "EmplesGalleryCollectionFlowLayout.h"
#import "EmplesGridViewCell.h"
#import "UICollectionView+Reusable.h"

@interface EmplesGalleryView ()

@property (strong, nonatomic) UICollectionView *collection;

@end

@implementation EmplesGalleryView

@synthesize viewModel;

- (void)viewDidLoad {
    [super viewDidLoad];
    [self bindViewModel];
    [self.viewModel viewDidLoad];
}

-(void)bindViewModel
{
    RAC(self, title) = RACObserve(self, viewModel.title);
    RAC(self.collection, dataSource) = RACObserve(self, viewModel.dataSource);
    RAC(self.collection, delegate) = RACObserve(self, viewModel.delegate);
    
    @weakify(self);
    [[[RACObserve(self.viewModel.dataSource, source) ignore:nil] distinctUntilChanged]
     subscribeNext:^(id _)
     {
         @strongify(self);
         [self.collection reloadData];
     }];
    
    [[[self.viewModel.loadItemsAction.executing skipWhileBlock:^ BOOL (NSNumber *loading) {
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

-(UICollectionView*)collection
{
    if(!_collection)
    {
        EmplesGalleryCollectionFlowLayout *layout = [[EmplesGalleryCollectionFlowLayout alloc] init];
        _collection = [[UICollectionView alloc] initWithFrame:self.view.bounds
                                             collectionViewLayout:layout];
        _collection.backgroundColor = [UIColor colorNamed:emplesGreenColor];
        [_collection setAutoresizingMask:UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth];
        [self.view addSubview:_collection];
        [_collection registerCellNib:EmplesGridViewCell.class];
    }
    return _collection;
}

@end
