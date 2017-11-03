//
//  EmplesAreaModel.h
//  emplesMVC
//
//  Created by Vasily Popov on 10/29/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DataAreaRequestClient.h"
#import "DecoratorModelProtocol.h"

@class EmplesAreasModel;
@protocol EmplesAreasProtocolDelegate

-(void)areasModel:(EmplesAreasModel*)model didFinishWithResponse:(id)response;
-(void)areasModel:(EmplesAreasModel*)model didFinishWithError:(NSError*)error;
-(void)selectedItem:(id)item;
@end

@interface EmplesAreasModel : NSObject<DecoratorModelProtocol>

@property (nonatomic, weak) id<EmplesAreasProtocolDelegate> delegate;

- (instancetype)init __unavailable;
- (instancetype)initWithClient:(DataAreaRequestClient*)client NS_DESIGNATED_INITIALIZER;


-(void)fetchAreas;

@end
