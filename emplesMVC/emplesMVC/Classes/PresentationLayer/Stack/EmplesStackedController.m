//
//  EmplesStackedController.m
//  emplesMVC
//
//  Created by Vasily Popov on 10/31/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

#import "EmplesStackedController.h"
@class EmplesRecAreaJSONModel;

@interface EmplesStackedController () <EmplesAreasProtocolDelegate>

@property (nonatomic, strong) EmplesAreasModel *model;

@end

@implementation EmplesStackedController

-(instancetype)initWithModel:(EmplesAreasModel*)model
{
    self = [super init];
    if (self) {
        self.model = model;
        self.model.delegate = self;
    }
    return self;
}

-(void)viewDidLoad
{
    [self.view showProgressView];
    [self.model fetchAreas];
}

#pragma mark - EmplesAreaProtocolDelegate

-(void)areasModel:(EmplesAreasModel*)model didFinishWithResponse:(id)response
{
    [self.view showData];
    [self.view hideProgressView];
}
-(void)areasModel:(EmplesAreasModel*)model didFinishWithError:(NSError*)error
{
    [self.view hideProgressView];
    [self.router showAlertWithTitle:@"Error" message:error.localizedDescription];
}


-(void)selectedItem:(EmplesRecAreaJSONModel*)item
{
    [self.router navigateToItemDetail:item];
}

@end
