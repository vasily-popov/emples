//
//  EmplesMenuController.m
//  emplesMVC
//
//  Created by Vasily Popov on 10/28/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

#import "EmplesMenuPresenter.h"
#import "EnumMenuSelectedItem.h"
#import "EmplesMenuModel.h"

@interface EmplesMenuPresenter () <EmplesMenuSelectProtocol>

@property (nonatomic, strong) EmplesMenuModel *model;

@end

@implementation EmplesMenuPresenter

-(instancetype)initWithModel:(EmplesMenuModel*)model
{
    self = [super init];
    if (self) {
        self.model = model;
        self.model.delegate = self;
    }
    return self;
}


#pragma mark - EmplesMenuRouteProtocol

-(void)selectedItem:(EnumMenuSelectedItem)item;
{
    [self.router navigateToSelectedItem:item];
}

#pragma mark - public

-(void)viewDidLoad
{
    [self.view setTableDataSource:[self.model buildSourceModel]];
}
@end
