//
//  EmplesCollectionViewProtocol.h
//  emplesMVC
//
//  Created by Vasily Popov on 10/31/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

#import <Foundation/Foundation.h>

@class EmplesCollectionPresenter;

@protocol EmplesCollectionViewProtocol <NSObject>

@property (nonatomic, strong) EmplesCollectionPresenter *presenter;

-(void)showProgressView;
-(void)hideProgressView;
-(void)updateCollectionItems:(NSArray*)array;

@end
