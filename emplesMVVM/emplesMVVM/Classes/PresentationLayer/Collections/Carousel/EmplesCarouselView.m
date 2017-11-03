//
//  EmplesCaruselView.m
//  emplesMVC
//
//  Created by Vasily Popov on 10/28/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

#import "EmplesCarouselView.h"
#import "EmplesProgressView.h"
#import "ColorStrings.h"

#import "EmplesCollectionPresenter.h"
#import "EmplesCarouselViewManager.h"
#import <iCarousel/iCarousel.h>

@interface EmplesCarouselView ()

@property (strong, nonatomic) iCarousel *carousel;
@property (strong, nonatomic) EmplesCarouselViewManager *sourceManager;
@property (strong, nonatomic) EmplesProgressView *progressView;

@end

@implementation EmplesCarouselView

@synthesize presenter;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = [@"Carousel" uppercaseString];
    [self createCarusel];
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

-(void)createCarusel
{
    [self.view setBackgroundColor: [UIColor colorNamed:emplesGreenColor]];
    self.carousel = [[iCarousel alloc] initWithFrame:self.view.bounds];
    self.carousel.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    self.carousel.type = iCarouselTypeCoverFlow2;
    self.sourceManager = [[EmplesCarouselViewManager alloc] init];
    self.carousel.dataSource = [self.sourceManager dataSourceForCarouselView:self.carousel];
    self.carousel.delegate = [self.sourceManager delegateForCarouselView:self.carousel];
    
    //add carousel to view
    [self.view addSubview:self.carousel];
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
    [self.carousel reloadData];
}

@end
