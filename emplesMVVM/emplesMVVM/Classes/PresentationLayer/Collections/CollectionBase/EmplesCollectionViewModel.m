//
//  EmplesCollectionController.m
//  emplesMVC
//
//  Created by Vasily Popov on 10/31/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

#import "EmplesCollectionViewModel.h"
#import "EmplesRecreationAreaModel.h"
#import "GenericTableViewSource.h"

@interface EmplesCollectionViewModel ()

@property (nonatomic, strong) RACCommand *loadItemsAction;

@end

@implementation EmplesCollectionViewModel

@synthesize title;
@dynamic dataSource, delegate;

- (RACCommand *)loadItemsAction
{
    if (!_loadItemsAction)
    {
        _loadItemsAction = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input)
        {
            return [self displayAreaCollection];
        }];
    }
    return _loadItemsAction;
}

- (RACSignal *)displayAreaCollection
{
    RACSignal *signal = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        
        [self.displayCollectionUseCase displayAreaCollection:^(NSArray<EmplesRecreationAreaModel*> *areas,
                                                               NSError *error)
         {
             if(error)
             {
                 [subscriber sendError:error];
             }
             else
             {
                 [subscriber sendNext:areas];
                 [subscriber sendCompleted];
             }
         }];
        return nil;
    }];
    return signal;
}

-(void)viewDidLoad
{
    @weakify(self);
    [[self.loadItemsAction execute:NULL]
     subscribeNext:^(NSArray<EmplesRecreationAreaModel*> *areas)
     {
         @strongify(self);
         [self displayAreas:areas];
     }
     error:^(NSError * _Nullable error)
     {
         @strongify(self);
         [self showError:error];
     }
     completed:^
    {
        
    }];
}

-(void)showError:(NSError*)error
{
    [self.router showAlertWithTitle:@"Error" message:error.localizedDescription];
}

-(void)displayAreas:(NSArray<EmplesRecreationAreaModel*> *)areas
{
    NSArray *array = [self prepareCollectionArrayFromArray:areas];
    [self.dataSource setDataSource:array];
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
