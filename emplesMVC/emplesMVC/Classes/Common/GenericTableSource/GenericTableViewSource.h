//
//  GenericDataSource.h
//  emplesMVC
//
//  Created by Vasily Popov on 10/28/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol GenericTableViewSourceProtocol

@property (nonatomic, strong, readonly) NSArray *source;

@end

@interface GenericTableViewSource : NSObject <GenericTableViewSourceProtocol,UITableViewDataSource>

-(instancetype)initWithSource:(NSArray*)source;
-(void)setDataSource:(NSArray*)source;
-(void)appendItems:(NSArray*)items;


@end

