//
//  ViewCellModelProtocol.h
//  emplesMVC
//
//  Created by Vasily Popov on 10/28/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ViewCellModelProtocol <NSObject>

//@property (strong, nonatomic) id ponsoModel;

- (id)getModelValue;
- (NSString*)cellClassName;

@end

