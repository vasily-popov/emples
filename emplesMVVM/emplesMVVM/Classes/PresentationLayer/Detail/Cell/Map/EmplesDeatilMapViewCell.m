//
//  EmplesDeatilMapViewCell.m
//  emplesMVC
//
//  Created by Vasily Popov on 10/30/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

#import "EmplesDeatilMapViewCell.h"
#import "EmplesDetailMapCellViewModel.h"
#import <GoogleMaps/GoogleMaps.h>
#define ZOOM_DISTANCE 11

@interface EmplesDeatilMapViewCell()<GMSMapViewDelegate>

@property (strong, nonatomic) GMSMapView *map;
@property (strong, nonatomic) EmplesDetailMapCellViewModel *viewModel;

@end

@implementation EmplesDeatilMapViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.map = [[GMSMapView alloc] initWithFrame:CGRectZero];
        self.map.buildingsEnabled = NO;
        self.map.indoorEnabled = NO;
        [self.contentView addSubview:self.map];
        [self setupConstraints];
    }
    
    return self;
}

-(void)setupConstraints
{
    [self.map setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.map.leftAnchor constraintEqualToAnchor:self.contentView.leftAnchor constant:0].active = YES;
    [self.map.rightAnchor constraintEqualToAnchor:self.contentView.rightAnchor constant:0].active = YES;
    [self.map.topAnchor constraintEqualToAnchor:self.contentView.topAnchor constant:0].active = YES;
    [self.map.bottomAnchor constraintEqualToAnchor:self.contentView.bottomAnchor constant:0].active = YES;
}

- (void)configureWithModel:(id<ViewCellModelProtocol>)viewModel
{
    if ([viewModel isKindOfClass:[EmplesDetailMapCellViewModel class]])
    {
        if(!self.viewModel)
        {
            self.viewModel = (EmplesDetailMapCellViewModel *)viewModel;
            [self updateMap:self.viewModel.coordinate];
        }
    }
}

- (void)updateMap:(CLLocationCoordinate2D)coordinate
{
    GMSMarker *marker = [[GMSMarker alloc] init];
    marker.position = CLLocationCoordinate2DMake(coordinate.latitude, coordinate.longitude);
    marker.map = self.map;
    
    GMSCameraPosition *camera = [GMSCameraPosition
                                 cameraWithLatitude:coordinate.latitude
                                 longitude:coordinate.longitude
                                 zoom:ZOOM_DISTANCE bearing:0 viewingAngle:0];
    [self.map setCamera:camera];
}

@end
