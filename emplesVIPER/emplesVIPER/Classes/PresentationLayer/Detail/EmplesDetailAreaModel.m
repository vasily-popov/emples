//
//  EmplesDetailAreaModel.m
//  emplesMVC
//
//  Created by Vasily Popov on 10/30/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

#import "EmplesDetailAreaModel.h"
#import "EmplesRecreationArea.h"
#import "EmplesDetailDirectionsCellModel.h"
#import "EmplesDetailMapCellModel.h"
#import "EmplesDetailDescriptionCellModel.h"
#import "DataSourceItem.h"

@interface EmplesDetailAreaModel()

@property (nonatomic, strong) EmplesRecreationArea* area;
@property (nonatomic, strong) NSArray* dataSource;
@end

@implementation EmplesDetailAreaModel

- (instancetype)initWithItem:(EmplesRecreationArea*)area
{
    self = [super init];
    if (self)
    {
        self.area = area;
        [self createDataSource];
    }
    return self;
}

-(void)dealloc
{
    
}

-(NSString*)titleName
{
    return self.area.areaName;
}

-(void)createDataSource
{
    CGFloat screenHeight = [UIScreen mainScreen].bounds.size.height;
    NSMutableArray *array = [NSMutableArray array];
    
    {
        CLLocationCoordinate2D coordinate = CLLocationCoordinate2DMake(self.area.latitude, self.area.longitude);
        EmplesDetailMapCellModel *item = [EmplesDetailMapCellModel new];
        item.coordinate = coordinate;
        DataSourceItem *row = [[DataSourceItem alloc] initWithCellModel:item];
        row.rowHeight = screenHeight/3;
        [array addObject:row];
    }
    
    if(self.area.areaDescription.length)
    {
        EmplesDetailDescriptionCellModel *item = [EmplesDetailDescriptionCellModel new];
        item.descriptionText = self.area.areaDescription;
        item.imageURL = self.area.imageURL;
        DataSourceItem *row = [[DataSourceItem alloc] initWithCellModel:item];
        row.rowHeight = UITableViewAutomaticDimension;
        [array addObject:row];
    }
    
    if(self.area.areaDirections.length)
    {
        EmplesDetailDirectionsCellModel *item = [EmplesDetailDirectionsCellModel new];
        item.directionText = self.area.areaDirections;
        DataSourceItem *row = [[DataSourceItem alloc] initWithCellModel:item];
        row.rowHeight = UITableViewAutomaticDimension;
        [array addObject:row];
    }
    self.dataSource = array;
}

@end
