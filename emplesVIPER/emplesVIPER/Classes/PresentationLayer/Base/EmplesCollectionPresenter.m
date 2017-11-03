//
//  EmplesCollectionController.m
//  emplesMVC
//
//  Created by Vasily Popov on 10/31/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

#import "EmplesCollectionPresenter.h"
@class EmplesRecAreaJSONModel;

@interface EmplesCollectionPresenter () <EmplesAreasProtocolDelegate>

@property (nonatomic, strong) EmplesAreasModel *model;

@end

@implementation EmplesCollectionPresenter

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

-(NSArray*) prepareCollectionArray
{
    return nil;
}

#pragma mark - EmplesAreaProtocolDelegate

-(void)areasModel:(EmplesAreasModel*)model didFinishWithResponse:(id)response
{
    //response ignore here
    NSArray *array = [self prepareCollectionArray];
    [self.view updateCollectionItems:array];
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
