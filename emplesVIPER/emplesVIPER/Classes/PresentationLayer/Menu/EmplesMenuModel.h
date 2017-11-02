//
//  EmplesMenuModel.h
//  emplesMVC
//
//  Created by Vasily Popov on 10/28/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EnumMenuSelectedItem.h"
#import "DecoratorModelProtocol.h"

@protocol EmplesMenuSelectProtocol

-(void)selectedItem:(EnumMenuSelectedItem)item;

@end

@interface EmplesMenuModel : NSObject <DecoratorModelProtocol>

@property (nonatomic, weak) id<EmplesMenuSelectProtocol> delegate;

@end
