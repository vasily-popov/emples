//
//  EmplesDetailController.m
//  emplesMVC
//
//  Created by Vasily Popov on 10/30/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

#import "EmplesDetailViewModel.h"
#import "GenericTableViewSource.h"
#import "GenericTableViewDelegate.h"

#import "DataSourceItem.h"
#import "EmplesDetailMapCellViewModel.h"
#import "EmplesDetailDescriptionCellViewModel.h"
#import "EmplesDetailDirectionsCellViewModel.h"

@interface EmplesDetailViewModel ()

@property (nonatomic, strong) EmplesRecreationAreaModel *model;
@property (nonatomic, strong) GenericTableViewSource *dataSource;
@property (nonatomic, strong) GenericTableViewDelegate *delegate;

@end

@implementation EmplesDetailViewModel

@synthesize title = _title;

-(instancetype)initWithModel:(EmplesRecreationAreaModel*)model
{
    self = [super init];
    if (self) {
        self.model = model;
        [self initialize];
    }
    return self;
}

-(void)initialize
{
    _title = [self.model.areaName uppercaseString];
    _dataSource = [[GenericTableViewSource alloc] init];
    _delegate = [[GenericTableViewDelegate alloc] initWithDataSource:_dataSource];
}

-(void)viewDidLoad
{
    [_dataSource setDataSource:[self buildSourceModel]];
}

-(NSArray *)buildSourceModel
{
    CGFloat screenHeight = [UIScreen mainScreen].bounds.size.height;
    NSMutableArray *array = [NSMutableArray array];
    
    {
        CLLocationCoordinate2D coordinate = CLLocationCoordinate2DMake(self.model.latitude, self.model.longitude);
        EmplesDetailMapCellViewModel *item = [EmplesDetailMapCellViewModel new];
        item.coordinate = coordinate;
        DataSourceItem *row = [[DataSourceItem alloc] initWithCellModel:item];
        row.rowHeight = screenHeight/3;
        [array addObject:row];
    }
    
    if(self.model.areaDescription.length > 0)
    {
        EmplesDetailDescriptionCellViewModel *item = [EmplesDetailDescriptionCellViewModel new];
        item.descriptionText = self.model.areaDescription;
        item.imageURL = self.model.imageURL;
        DataSourceItem *row = [[DataSourceItem alloc] initWithCellModel:item];
        row.rowHeight = UITableViewAutomaticDimension;
        [array addObject:row];
    }
    
    if(self.model.areaDirections.length > 0)
    {
        EmplesDetailDirectionsCellViewModel *item = [EmplesDetailDirectionsCellViewModel new];
        item.directionText = self.model.areaDirections;
        DataSourceItem *row = [[DataSourceItem alloc] initWithCellModel:item];
        row.rowHeight = UITableViewAutomaticDimension;
        [array addObject:row];
    }
    return array;
}

@end
