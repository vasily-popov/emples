//
//  EmplesGridView.m
//  emplesMVC
//
//  Created by Vasily Popov on 10/28/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

#import "EmplesGridView.h"
#import "EmplesGridCollectionViewManager.h"
#import "EmplesProgressView.h"
#import "EmplesCollectionPresenter.h"
#import "ColorStrings.h"

@interface EmplesGridView ()

@property (strong, nonatomic) UICollectionView *collection;
@property (strong, nonatomic) EmplesGridCollectionViewManager *sourceManager;
@property (strong, nonatomic) EmplesProgressView *progressView;

@end

@implementation EmplesGridView

@synthesize presenter;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = [@"Grid" uppercaseString];
    [self createCollectionView];
    self.progressView = [[EmplesProgressView alloc] initWithFrame:CGRectZero];
    [self.navigationController.view addSubview:self.progressView];
    [self setupConstraints];
    [self.presenter viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setupConstraints
{
    self.progressView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.progressView.leftAnchor constraintEqualToAnchor:self.navigationController.view.leftAnchor constant:0].active = YES;
    [self.progressView.rightAnchor constraintEqualToAnchor:self.navigationController.view.rightAnchor constant:0].active = YES;
    [self.progressView.topAnchor constraintEqualToAnchor:self.navigationController.view.topAnchor constant:0].active = YES;
    [self.progressView.bottomAnchor constraintEqualToAnchor:self.navigationController.view.bottomAnchor constant:0].active = YES;
}

-(void)createCollectionView
{
    CGRect screenSize = [[UIScreen mainScreen] bounds];
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    layout.minimumLineSpacing = 4;
    layout.minimumInteritemSpacing = 4;
    layout.sectionInset = UIEdgeInsetsMake(2, 2, 2, 2);
    layout.itemSize = CGSizeMake((screenSize.size.width-8)/2,150);
    self.collection = [[UICollectionView alloc] initWithFrame:self.view.bounds
                                         collectionViewLayout:layout];
    self.collection.dragInteractionEnabled = NO;
    self.collection.backgroundColor = [UIColor colorNamed:emplesGreenColor];
    [self.collection setAutoresizingMask:UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth];
    [self.view addSubview:self.collection];
    self.sourceManager = [[EmplesGridCollectionViewManager alloc] init];
    self.collection.dataSource = [self.sourceManager dataSourceForCollectionView:self.collection];
    self.collection.delegate = [self.sourceManager delegateForCollectionView:self.collection];
}

-(void)showProgressView
{
    [self.progressView show];
}

-(void)hideProgressView
{
    [self.progressView hide];
}

-(void)updateCollectionItems:(NSArray *)array
{
    [self.sourceManager updateDataSource:array];
    [self.collection reloadData];
}
@end
