//
//  EmplesGalleryCollectionFlowLayout.m
//  emplesMVC
//
//  Created by Vasily Popov on 10/31/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

#import "EmplesGalleryCollectionFlowLayout.h"

static CGFloat const kGallerySwipeVelocity = 0.5f;
static CGFloat const kGalleryLineSpacing = 24.0f;

@implementation EmplesGalleryCollectionFlowLayout

- (void)prepareLayout {
    [super prepareLayout];
    
    self.itemSize = [self getItemSize];
    
    self.minimumLineSpacing = kGalleryLineSpacing;
    self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    CGFloat horizontalInset = (self.collectionView.frame.size.width - self.itemSize.width) / 2;
    self.sectionInset = UIEdgeInsetsMake(0.0,horizontalInset,0.0,horizontalInset);
}

- (CGFloat)pageWidth
{
    CGSize itemSize = [self getItemSize];
    return itemSize.width + kGalleryLineSpacing;
}
- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)proposedContentOffset
                                 withScrollingVelocity:(CGPoint)velocity {
    CGFloat rawPageValue = self.collectionView.contentOffset.x / self.pageWidth;
    CGFloat currentPage = (velocity.x > 0.0) ? floor(rawPageValue) : ceil(rawPageValue);
    CGFloat nextPage = (velocity.x > 0.0) ? ceil(rawPageValue) : floor(rawPageValue);
    
    BOOL pannedLessThanAPage = fabs(1 + currentPage - rawPageValue) > 0.5;
    BOOL swiped = fabs(velocity.x) > kGallerySwipeVelocity;
    if (pannedLessThanAPage && swiped)
    {
        proposedContentOffset.x = nextPage * self.pageWidth;
    }
    else
    {
        proposedContentOffset.x = round(rawPageValue) * self.pageWidth;
    }
    
    return proposedContentOffset;
}

- (CGSize)getItemSize
{
    if(self.collectionView.frame.size.width < self.collectionView.frame.size.height) {
        return CGSizeMake(self.collectionView.frame.size.width - 4*kGalleryLineSpacing, self.collectionView.frame.size.height * 0.6);
    }
    else
    {
        return CGSizeMake(self.collectionView.frame.size.width - 8*kGalleryLineSpacing, self.collectionView.frame.size.height * 0.9);
    }
}

@end

