//
//  EmplesStackedAssembly.h
//  emplesMVP
//
//  Created by Vasily Popov on 11/1/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

#import <Typhoon/Typhoon.h>
#import "EnumMenuSelectedItem.h"
#import "EmplesCollectionViewProtocol.h"

@class ApplicationAssembly;
@class DataLayerAssembly;
@class EmplesRecreationAreaModel;
@class EmplesDetailView;

@interface EmplesCollectionsAssembly : TyphoonAssembly

@property (nonatomic, strong, readonly) ApplicationAssembly *appAssembly;
@property (nonatomic, strong, readonly) DataLayerAssembly *datalayerAssembly;

- (UIViewController<EmplesCollectionViewProtocol> *)collectionViewFor:(NSNumber *)item;
- (EmplesDetailView*)detailViewArea:(EmplesRecreationAreaModel*)area;

@end
