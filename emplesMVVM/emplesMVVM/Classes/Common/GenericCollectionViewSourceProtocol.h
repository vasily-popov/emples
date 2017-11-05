//
//  GenericCollectionViewSourceProtocol.h
//  emplesMVVM
//
//  Created by Vasily Popov on 11/5/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol GenericCollectionViewSourceProtocol <NSObject>

@property (nonatomic, strong, readonly) NSArray *source;

-(instancetype)initWithSource:(NSArray*)source;
-(void)setDataSource:(NSArray*)source;
-(void)appendItems:(NSArray*)items;

@end

