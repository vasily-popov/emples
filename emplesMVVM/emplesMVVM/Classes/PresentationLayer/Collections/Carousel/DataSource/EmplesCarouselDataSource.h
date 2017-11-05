//
//  EmplesCarouselDataSource.h
//  emplesMVVM
//
//  Created by Vasily Popov on 11/5/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <iCarousel/iCarousel.h>
#import "GenericCollectionViewSourceProtocol.h"

@interface EmplesCarouselDataSource : NSObject <GenericCollectionViewSourceProtocol,
                                                iCarouselDataSource>

@end
