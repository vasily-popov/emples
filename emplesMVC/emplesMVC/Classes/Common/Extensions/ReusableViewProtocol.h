//
//  ReusableView.h
//  emplesMVC
//
//  Created by Vasily Popov on 10/28/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ReusableViewProtocol <NSObject>

+(NSString*)defaultReuseIdentifier;

@end

@protocol NibLoadableViewProtocol <NSObject>

+(NSString*)nibName;

@end

@protocol UIViewCellRegisterProtocol <NSObject>

-(void)registerCell:(Class<ReusableViewProtocol>) type;
-(void)registerCellNib:(Class<NibLoadableViewProtocol, ReusableViewProtocol>) type;

@end

