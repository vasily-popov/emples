//
//  EmplesMenuAssembly.m
//  emplesMVP
//
//  Created by Vasily Popov on 11/1/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

#import "EmplesMenuAssembly.h"
#import "EmplesMenuModel.h"
#import "EmplesMenuRouter.h"
#import "EmplesMenuPresenter.h"
#import "DataLayerAssembly.h"
#import "EmplesCollectionsAssembly.h"

@interface EmplesMenuAssembly()

@property (nonatomic, strong, readonly) EmplesCollectionsAssembly *collectionsAssembly;


@end

@implementation EmplesMenuAssembly

- (EmplesMenuModel*)menuModel
{
    return [TyphoonDefinition withClass:[EmplesMenuModel class]
                          configuration:^(TyphoonDefinition* definition)
            {
                [definition injectProperty:@selector(delegate) with:[self menuPresenter]];
            }];
}

- (EmplesMenuPresenter*)menuPresenter
{
    return [TyphoonDefinition withClass:[EmplesMenuPresenter class]
                          configuration:^(TyphoonDefinition* definition)
            {
                [definition useInitializer:@selector(initWithModel:) parameters:^(TyphoonMethod *initializer)
                 {
                     [initializer injectParameterWith:[self menuModel]];
                 }];
                [definition injectProperty:@selector(view) with:[self menuView]];
                [definition injectProperty:@selector(router) with:[self menuRouter]];
            }];
}

- (EmplesMenuView*)menuView
{
    return [TyphoonDefinition withClass:[EmplesMenuView class]
                          configuration:^(TyphoonDefinition* definition)
            {
                [definition injectProperty:@selector(presenter) with:[self menuPresenter]];
            }];
}

- (EmplesMenuRouter*)menuRouter
{
    return [TyphoonDefinition withClass:[EmplesMenuRouter class]
                          configuration:^(TyphoonDefinition* definition)
            {
                [definition injectProperty:@selector(viewController)
                                      with:[self.appAssembly rootViewController]];
                [definition injectProperty:@selector(window)
                                      with:[self.appAssembly window]];
                [definition injectProperty:@selector(collectionsAssembly)
                                      with:self.collectionsAssembly];
            }];
}


@end
