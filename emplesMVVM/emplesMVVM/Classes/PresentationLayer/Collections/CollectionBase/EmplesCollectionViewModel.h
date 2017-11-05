//
//  EmplesCollectionController.h
//  emplesMVC
//
//  Created by Vasily Popov on 10/31/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EmplesItemRouter.h"
#import "DisplayAreaCollectionUseCase.h"
#import "GenericTableViewSource.h"
#import "GenericTableViewDelegate.h"

@class EmplesRecreationAreaModel;
@protocol EmplesCollectionViewModelProtocol

@property (nonatomic, strong, readonly) NSString *title;
@property (nonatomic, strong, readonly) id<GenericCollectionViewSourceProtocol> dataSource;
@property (nonatomic, strong, readonly) id delegate;
@property (nonatomic, strong, readonly) RACCommand *loadItemsAction;

-(NSArray*)prepareCollectionArrayFromArray:(NSArray *)areas;
-(void)selectedItem:(EmplesRecreationAreaModel*)item;
-(void)viewDidLoad;

@end

@interface EmplesCollectionViewModel : NSObject <EmplesCollectionViewModelProtocol>

-(instancetype)init __unavailable;
@property (nonatomic, strong) EmplesItemRouter *router;
@property (nonatomic, strong) id<DisplayAreaCollectionUseCase> displayCollectionUseCase;

@end
