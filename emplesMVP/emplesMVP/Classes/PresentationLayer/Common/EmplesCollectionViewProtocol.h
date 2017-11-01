//
//  EmplesCollectionViewProtocol.h
//  emplesMVC
//
//  Created by Vasily Popov on 10/31/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

#import <Foundation/Foundation.h>

@class EmplesCollectionController;

@protocol EmplesCollectionViewProtocol <NSObject>

@property (nonatomic, strong) EmplesCollectionController *controller;

-(void)showProgressView;
-(void)hideProgressView;
-(void)showData;

@end
