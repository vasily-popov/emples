//
//  EmplesCollectionController.m
//  emplesMVC
//
//  Created by Vasily Popov on 10/31/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

#import "EmplesCollectionPresenter.h"
#import "EmplesRecreationAreaModel.h"

@interface EmplesCollectionPresenter ()

@end

@implementation EmplesCollectionPresenter


-(void)viewDidLoad
{
    [self.view showProgressView];
    __weak typeof(self) weakSelf = self;
    [self.displayCollectionUseCase displayAreaCollection:^(NSArray<EmplesRecreationAreaModel*> *areas,
                                                           NSError *error)
     {
        __strong typeof(self) strongSelf = weakSelf;
        if(strongSelf)
        {
            if(error)
            {
                [strongSelf showError:error];
            }
            else
            {
                [strongSelf displayAreas:areas];
            }
        }
    }];
}

-(void)showError:(NSError*)error
{
    [self.view hideProgressView];
    [self.router showAlertWithTitle:@"Error" message:error.localizedDescription];
}

-(void)displayAreas:(NSArray<EmplesRecreationAreaModel*> *)areas
{
    NSArray *array = [self prepareCollectionArrayFromArray:areas];
    [self.view updateCollectionItems:array];
    [self.view hideProgressView];
}

#pragma mark - EmplesCollectionPresenterProtocol

-(NSArray*) prepareCollectionArrayFromArray:(NSArray *)areas
{
    return areas;
}

-(void)selectedItem:(EmplesRecreationAreaModel*)item
{
    [self.router navigateToItemDetail:item];
}

@end
