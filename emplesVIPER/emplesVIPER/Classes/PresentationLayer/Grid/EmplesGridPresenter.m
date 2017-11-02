//
//  EmplesGridController.m
//  emplesMVC
//
//  Created by Vasily Popov on 10/30/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

#import "EmplesGridPresenter.h"
#import "EmplesGridModelDecorator.h"

@interface EmplesGridPresenter ()

@property (nonatomic, strong) EmplesGridModelDecorator *decorator;

@end

@implementation EmplesGridPresenter

-(instancetype)initWithModel:(EmplesAreasModel*)model
{
    self = [super initWithModel:model];
    if(self)
    {
        self.decorator = [[EmplesGridModelDecorator alloc] initWithModel:model];
    }
    return self;
}
-(NSArray*) prepareCollectionArray
{
    return self.decorator.dataSource;
}

@end
