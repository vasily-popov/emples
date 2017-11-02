//
//  EmplesDetailView.h
//  emplesMVC
//
//  Created by Vasily Popov on 10/28/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

#import <UIKit/UIKit.h>

@class EmplesDetailPresenter;

@protocol EmplesDetailViewProtocol

-(void)setViewTitle:(NSString*)title;
-(void)setSourceArray:(NSArray*)array;
@end

@interface EmplesDetailView : UIViewController <EmplesDetailViewProtocol>

@property (nonatomic, strong) EmplesDetailPresenter *presenter;

@end
