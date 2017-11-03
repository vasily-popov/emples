//
//  EmplesCollectionController.h
//  emplesMVC
//
//  Created by Vasily Popov on 10/31/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EmplesCollectionViewProtocol.h"
#import "EmplesItemRouter.h"
#import "DisplayAreaCollectionUseCase.h"

@class EmplesRecreationArea;
@protocol EmplesCollectionPresenterProtocol

-(NSArray*) prepareCollectionArrayFromArray:(NSArray *)areas;
-(void)selectedItem:(EmplesRecreationArea*)item;

@end

@interface EmplesCollectionPresenter : NSObject <EmplesCollectionPresenterProtocol>

@property (nonatomic, weak) id<EmplesCollectionViewProtocol>view;
@property (nonatomic, strong) EmplesItemRouter *router;

@property (nonatomic, strong) id<DisplayAreaCollectionUseCase> displayCollectionUseCase;

-(instancetype)init __unavailable;
-(void)viewDidLoad;

@end
