//
//  EmplesStackedAssembly.m
//  emplesMVP
//
//  Created by Vasily Popov on 11/1/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

#import "EmplesCollectionsAssembly.h"
#import "EmplesItemRouter.h"
#import "DataLayerAssembly.h"
#import "ApplicationAssembly.h"

#import "EmplesStackedView.h"
#import "EmplesListView.h"
#import "EmplesGridView.h"
#import "EmplesGalleryView.h"
#import "EmplesCarouselView.h"

#import "EmplesStackedViewModel.h"
#import "EmplesGridViewModel.h"
#import "EmplesGalleryViewModel.h"
#import "EmplesCarouselViewModel.h"

#import "EmplesRecAreaJSONModel.h"
#import "EmplesDetailView.h"
#import "EmplesDetailViewModel.h"

@implementation EmplesCollectionsAssembly

- (UIViewController*)collectionViewFor:(NSNumber *)item
{
    return [TyphoonDefinition withOption:item matcher:^(TyphoonOptionMatcher *matcher)
            {
                [matcher caseEqual:@(EnumMenuSelectedItemGrid) use:[self gridView]];
                [matcher caseEqual:@(EnumMenuSelectedItemStack) use:[self stackedView]];
                [matcher caseEqual:@(EnumMenuSelectedItemGallery) use:[self galleryView]];
                [matcher caseEqual:@(EnumMenuSelectedItemCarusel) use:[self carouselView]];
                [matcher caseEqual:@(EnumMenuSelectedItemList) use:[self listView]];
            }];
}

-(EmplesGridView *) gridView
{
    return [TyphoonDefinition withClass:[EmplesGridView class]
                          configuration:^(TyphoonDefinition* definition)
            {
                [definition injectProperty:@selector(viewModel)
                                      with:[self gridViewModel]];
            }];
}

- (EmplesGridViewModel*)gridViewModel
{
    return [TyphoonDefinition withClass:[EmplesGridViewModel class]
                          configuration:^(TyphoonDefinition* definition)
            {
                [definition injectProperty:@selector(displayCollectionUseCase) with:[self.datalayerAssembly displayAreaCollectionUseCase]];
                [definition injectProperty:@selector(router) with:[self itemRouter]];
            }];
}

-(EmplesStackedView *) stackedView
{
    return [TyphoonDefinition withClass:[EmplesStackedView class]
                          configuration:^(TyphoonDefinition* definition)
            {
                [definition injectProperty:@selector(viewModel)
                                      with:[self stackedViewModel]];
            }];
}

- (EmplesStackedViewModel*)stackedViewModel
{
    return [TyphoonDefinition withClass:[EmplesStackedViewModel class]
                          configuration:^(TyphoonDefinition* definition)
            {
                [definition injectProperty:@selector(displayCollectionUseCase) with:[self.datalayerAssembly displayAreaCollectionUseCase]];
                [definition injectProperty:@selector(router) with:[self itemRouter]];
            }];
}

-(EmplesGalleryView *) galleryView
{
    return [TyphoonDefinition withClass:[EmplesGalleryView class]
                          configuration:^(TyphoonDefinition* definition)
            {
                [definition injectProperty:@selector(viewModel)
                                      with:[self galleryViewModel]];
            }];
}

- (EmplesGalleryViewModel*)galleryViewModel
{
    return [TyphoonDefinition withClass:[EmplesGalleryViewModel class]
                          configuration:^(TyphoonDefinition* definition)
            {
                [definition injectProperty:@selector(displayCollectionUseCase) with:[self.datalayerAssembly displayAreaCollectionUseCase]];
                [definition injectProperty:@selector(router) with:[self itemRouter]];
            }];
}

-(EmplesCarouselView *) carouselView
{
    return [TyphoonDefinition withClass:[EmplesCarouselView class]
                          configuration:^(TyphoonDefinition* definition)
            {
                [definition injectProperty:@selector(viewModel)
                                      with:[self carouselViewModel]];
            }];
}

- (EmplesCarouselViewModel*)carouselViewModel
{
    return [TyphoonDefinition withClass:[EmplesCarouselViewModel class]
                          configuration:^(TyphoonDefinition* definition)
            {
                [definition injectProperty:@selector(displayCollectionUseCase) with:[self.datalayerAssembly displayAreaCollectionUseCase]];
                [definition injectProperty:@selector(router) with:[self itemRouter]];
            }];
}

-(EmplesListView *) listView
{
    return [TyphoonDefinition withClass:[EmplesListView class]
                          configuration:^(TyphoonDefinition* definition)
            {
                [definition injectProperty:@selector(viewModel)
                                      with:[self listViewModel]];
            }];
}

- (EmplesListViewModel*)listViewModel
{
    return [TyphoonDefinition withClass:[EmplesListViewModel class]
                          configuration:^(TyphoonDefinition* definition)
            {
                [definition injectProperty:@selector(displayCollectionUseCase) with:[self.datalayerAssembly displayAreaCollectionUseCase]];
                [definition injectProperty:@selector(router) with:[self itemRouter]];
            }];
}

- (EmplesItemRouter*)itemRouter
{
    return [TyphoonDefinition withClass:[EmplesItemRouter class]
                          configuration:^(TyphoonDefinition* definition)
            {
                [definition useInitializer:@selector(initWithNavigationVC: andWindow:) parameters:^(TyphoonMethod *initializer)
                 {
                     [initializer injectParameterWith:[self.appAssembly rootViewController]];
                     [initializer injectParameterWith:[self.appAssembly window]];
                 }];
                [definition injectProperty:@selector(collectionsAssembly)
                                      with:self];
                definition.scope = TyphoonScopeWeakSingleton;
            }];
}

- (EmplesDetailView*)detailViewArea:(EmplesRecreationAreaModel*)area
{
    return [TyphoonDefinition withClass:[EmplesDetailView class]
                          configuration:^(TyphoonDefinition* definition)
            {
                [definition injectProperty:@selector(viewModel)
                                      with:[self detailViewModelWithArea:area]];
            }];
}

-(EmplesDetailViewModel*)detailViewModelWithArea:(EmplesRecreationAreaModel*)area
{
    return [TyphoonDefinition withClass:[EmplesDetailViewModel class]
                          configuration:^(TyphoonDefinition* definition)
            {
                [definition useInitializer:@selector(initWithModel:)
                                parameters:^(TyphoonMethod *initializer)
                 {
                     [initializer injectParameterWith:area];
                 }];
            }];
}

@end
