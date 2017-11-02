//
//  EmplesListController.m
//  emplesMVC
//
//  Created by Vasily Popov on 10/29/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

#import "EmplesListPresenter.h"
#import "EmplesListModelDecorator.h"

@interface EmplesListPresenter ()

@property (nonatomic, strong) EmplesListModelDecorator *decorator;

@end

@implementation EmplesListPresenter

-(instancetype)initWithModel:(EmplesAreasModel*)model
{
    self = [super initWithModel:model];
    if(self)
    {
        self.decorator = [[EmplesListModelDecorator alloc] initWithModel:model];
    }
    return self;
}
-(NSArray*) prepareCollectionArray
{
    return self.decorator.dataSource;
}

@end
