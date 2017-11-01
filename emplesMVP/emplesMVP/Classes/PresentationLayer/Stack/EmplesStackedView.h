//
//  EmplesStackedView.h
//  emplesMVC
//
//  Created by Vasily Popov on 10/28/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EmplesListModelDecorator.h"
#import "EmplesCollectionViewProtocol.h"

@interface EmplesStackedView : UIViewController<EmplesCollectionViewProtocol>

@property (nonatomic, strong) EmplesListModelDecorator *model;

@end
