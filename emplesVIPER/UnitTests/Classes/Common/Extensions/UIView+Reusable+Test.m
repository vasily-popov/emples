//
//  UIView+Reusable+Test.m
//  emplesMVCTests
//
//  Created by Vasily Popov on 11/29/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//


#import <Specta/Specta.h>
#import <Expecta/Expecta.h>
#import <OCMock/OCMock.h>
#import "UIView+Reusable.h"
#import "UITableView+Reusable.h"
#import "UICollectionView+Reusable.h"


SpecBegin(Reusable)

describe(@"Reusable", ^{

    beforeAll(^{
    });
    
    it(@"UIView should have default resusable id", ^{
        
        NSString *viewResult = [UIView defaultReuseIdentifier];
        expect(viewResult).notTo.beNil();
        expect([viewResult isEqualToString:@"UIView"]).to.beTruthy();
    });
    
    
    it(@"UIView should have default nib name", ^{
        
        NSString *nibResult = [UIView nibName];
        expect(nibResult).notTo.beNil();
        expect([nibResult isEqualToString:@"UIView"]).to.beTruthy();
    });
    
    
    it(@"UITableView should have default resusable id", ^{
        
        NSString *viewResult = [UITableView defaultReuseIdentifier];
        expect(viewResult).notTo.beNil();
        expect([viewResult isEqualToString:@"UITableView"]).to.beTruthy();
    });
    
    it(@"UITableView should have default nib name", ^{
        
        NSString *nibResult = [UITableView nibName];
        expect(nibResult).notTo.beNil();
        expect([nibResult isEqualToString:@"UITableView"]).to.beTruthy();
    });
    
    it(@"UITableView should register cell", ^{
        
        UITableView *table = [UITableView new];
        expect(^{
            [table registerCell:UITableViewCell.class];
            [table registerCellNib:UITableViewCell.class];
        }).notTo.raiseAny();
    });
    
    
    it(@"UICollectionView should have default resusable id", ^{
        
        NSString *viewResult = [UICollectionView defaultReuseIdentifier];
        expect(viewResult).notTo.beNil();
        expect([viewResult isEqualToString:@"UICollectionView"]).to.beTruthy();
    });
    
    
    it(@"UICollectionView should have default nib name", ^{
        
        NSString *nibResult = [UICollectionView nibName];
        expect(nibResult).notTo.beNil();
        expect([nibResult isEqualToString:@"UICollectionView"]).to.beTruthy();
    });
    
    it(@"UICollectionView should register cell", ^{
        
        id mock = OCMClassMock([UICollectionViewLayout class]);
        UICollectionView *collection = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:mock];
        expect(^{
            [collection registerCell:UICollectionViewCell.class];
            [collection registerCellNib:UICollectionViewCell.class];
        }).notTo.raiseAny();
    });
    
    afterAll(^{
    });
});

SpecEnd

