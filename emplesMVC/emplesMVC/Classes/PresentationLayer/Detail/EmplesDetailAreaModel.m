//
//  EmplesDetailAreaModel.m
//  emplesMVC
//
//  Created by Vasily Popov on 10/30/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

#import "EmplesDetailAreaModel.h"
#import "EmplesRecAreaJSONModel.h"
#import "EmplesDetailDirectionsCellModel.h"
#import "EmplesDetailMapCellModel.h"
#import "EmplesDetailDescriptionCellModel.h"
#import "DataSourceItem.h"

@interface EmplesDetailAreaModel()

@property (nonatomic, strong) EmplesRecAreaJSONModel* model;
@property (nonatomic, strong) NSArray* dataSource;
@end

@implementation EmplesDetailAreaModel

- (instancetype)initWithItem:(EmplesRecAreaJSONModel*)model
{
    self = [super init];
    if (self)
    {
        self.model = model;
        [self createDataSource];
    }
    return self;
}

-(void)dealloc
{
    
}

-(NSString*)titleName
{
    return self.model.RecAreaName;
}

-(void)createDataSource
{
    CGFloat screenHeight = [UIScreen mainScreen].bounds.size.height;
    NSMutableArray *array = [NSMutableArray array];
    
    {
        CLLocationCoordinate2D coordinate = CLLocationCoordinate2DMake(self.model.RecAreaLatitude, self.model.RecAreaLongitude);
        EmplesDetailMapCellModel *item = [EmplesDetailMapCellModel new];
        item.coordinate = coordinate;
        DataSourceItem *row = [[DataSourceItem alloc] initWithCellModel:item];
        row.rowHeight = screenHeight/3;
        [array addObject:row];
    }
    
    if(self.model.RecAreaDescription.length)
    {
        EmplesDetailDescriptionCellModel *item = [EmplesDetailDescriptionCellModel new];
        item.descriptionText = self.model.RecAreaDescription;
        item.imageURL = self.model.imageURL;
        DataSourceItem *row = [[DataSourceItem alloc] initWithCellModel:item];
        row.rowHeight = UITableViewAutomaticDimension;
        [array addObject:row];
    }
    
    if(self.model.RecAreaDirections.length)
    {
        EmplesDetailDirectionsCellModel *item = [EmplesDetailDirectionsCellModel new];
        item.directionText = self.model.RecAreaDirections;
        DataSourceItem *row = [[DataSourceItem alloc] initWithCellModel:item];
        row.rowHeight = UITableViewAutomaticDimension;
        [array addObject:row];
    }
    self.dataSource = array;
}

@end
