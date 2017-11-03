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

#import "EmplesStackedPresenter.h"
#import "EmplesGridPresenter.h"
#import "EmplesGalleryPresenter.h"
#import "EmplesCarouselPresenter.h"


#import "EmplesRecAreaJSONModel.h"
#import "EmplesDetailView.h"
#import "EmplesDetailPresenter.h"
#import "EmplesDetailAreaModel.h"

@implementation EmplesCollectionsAssembly

- (UIViewController<EmplesCollectionViewProtocol> *)collectionViewFor:(NSNumber *)item
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
                [definition injectProperty:@selector(presenter)
                                      with:[self gridPresenter]];
            }];
}

- (EmplesGridPresenter*)gridPresenter
{
    return [TyphoonDefinition withClass:[EmplesGridPresenter class]
                          configuration:^(TyphoonDefinition* definition)
            {
                [definition injectProperty:@selector(displayCollectionUseCase) with:[self.datalayerAssembly displayAreaCollectionUseCase]];
                [definition injectProperty:@selector(view) with:[self gridView]];
                [definition injectProperty:@selector(router) with:[self itemRouter]];
            }];
}

-(EmplesStackedView *) stackedView
{
    return [TyphoonDefinition withClass:[EmplesStackedView class]
                          configuration:^(TyphoonDefinition* definition)
            {
                [definition injectProperty:@selector(presenter)
                                      with:[self stackedPresenter]];
            }];
}

- (EmplesStackedPresenter*)stackedPresenter
{
    return [TyphoonDefinition withClass:[EmplesStackedPresenter class]
                          configuration:^(TyphoonDefinition* definition)
            {
                [definition injectProperty:@selector(displayCollectionUseCase) with:[self.datalayerAssembly displayAreaCollectionUseCase]];
                [definition injectProperty:@selector(view) with:[self stackedView]];
                [definition injectProperty:@selector(router) with:[self itemRouter]];
            }];
}

-(EmplesGalleryView *) galleryView
{
    return [TyphoonDefinition withClass:[EmplesGalleryView class]
                          configuration:^(TyphoonDefinition* definition)
            {
                [definition injectProperty:@selector(presenter)
                                      with:[self galleryPresenter]];
            }];
}

- (EmplesGalleryPresenter*)galleryPresenter
{
    return [TyphoonDefinition withClass:[EmplesGalleryPresenter class]
                          configuration:^(TyphoonDefinition* definition)
            {
                [definition injectProperty:@selector(displayCollectionUseCase) with:[self.datalayerAssembly displayAreaCollectionUseCase]];
                [definition injectProperty:@selector(view) with:[self galleryView]];
                [definition injectProperty:@selector(router) with:[self itemRouter]];
            }];
}

-(EmplesCarouselView *) carouselView
{
    return [TyphoonDefinition withClass:[EmplesCarouselView class]
                          configuration:^(TyphoonDefinition* definition)
            {
                [definition injectProperty:@selector(presenter)
                                      with:[self carouselPresenter]];
            }];
}

- (EmplesCarouselPresenter*)carouselPresenter
{
    return [TyphoonDefinition withClass:[EmplesCarouselPresenter class]
                          configuration:^(TyphoonDefinition* definition)
            {
                [definition injectProperty:@selector(displayCollectionUseCase) with:[self.datalayerAssembly displayAreaCollectionUseCase]];
                [definition injectProperty:@selector(view) with:[self carouselView]];
                [definition injectProperty:@selector(router) with:[self itemRouter]];
            }];
}

-(EmplesListView *) listView
{
    return [TyphoonDefinition withClass:[EmplesListView class]
                          configuration:^(TyphoonDefinition* definition)
            {
                [definition injectProperty:@selector(presenter)
                                      with:[self listPresenter]];
            }];
}

- (EmplesListPresenter*)listPresenter
{
    return [TyphoonDefinition withClass:[EmplesListPresenter class]
                          configuration:^(TyphoonDefinition* definition)
            {
                [definition injectProperty:@selector(displayCollectionUseCase) with:[self.datalayerAssembly displayAreaCollectionUseCase]];
                [definition injectProperty:@selector(view) with:[self listView]];
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
                [definition injectProperty:@selector(presenter)
                                      with:[self detailPresenterWithArea:area]];
            }];
}

-(EmplesDetailPresenter*)detailPresenterWithArea:(EmplesRecreationAreaModel*)area
{
    return [TyphoonDefinition withClass:[EmplesDetailPresenter class]
                          configuration:^(TyphoonDefinition* definition)
            {
                [definition useInitializer:@selector(initWithModel:)
                                parameters:^(TyphoonMethod *initializer)
                 {
                     [initializer injectParameterWith:[self detailModelWith:area]];
                 }];
                [definition injectProperty:@selector(view)
                                      with:[self detailViewArea:area]];
            }];
}

-(EmplesDetailAreaModel*)detailModelWith:(EmplesRecreationAreaModel*)area
{
    return [TyphoonDefinition withClass:[EmplesDetailAreaModel class]
                          configuration:^(TyphoonDefinition* definition)
            {
                [definition useInitializer:@selector(initWithItem:)
                                parameters:^(TyphoonMethod *initializer)
                 {
                     [initializer injectParameterWith:area];
                 }];
            }];
}


@end
