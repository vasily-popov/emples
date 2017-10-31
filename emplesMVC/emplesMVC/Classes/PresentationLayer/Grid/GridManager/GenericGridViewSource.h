//
//  GenericGridViewSource.h
//  emplesMVC
//
//  Created by Vasily Popov on 10/30/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol GenericGridViewSourceProtocol

@property (nonatomic, strong, readonly) NSArray *source;

@end

@interface GenericGridViewSource : NSObject <GenericGridViewSourceProtocol,UICollectionViewDataSource>

-(instancetype)initWithSource:(NSArray*)source;
-(void)setDataSource:(NSArray*)source;
-(void)appendItems:(NSArray*)items;


@end
