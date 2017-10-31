//
//  EmplesCarouselViewManager.h
//  emplesMVC
//
//  Created by Vasily Popov on 10/31/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <iCarousel/iCarousel.h>

@protocol UICarouselSourceManager <NSObject>

- (instancetype)initWithSource:(NSArray*)source;
- (void)updateDataSource:(NSArray*)source;
- (void)appendItems:(NSArray*)items;
- (id<iCarouselDataSource>)dataSourceForCarouselView:(iCarousel *)view;
- (id<iCarouselDelegate>)delegateForCarouselView:(iCarousel *)view;

@end

@interface EmplesCarouselViewManager : NSObject <UICarouselSourceManager>

@end
