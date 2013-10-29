//
//  MasterGeoViewController.m
//  RememberMe
//
//  Created by Ibrahim Ayad on 10/23/13.
//  Copyright (c) 2013 Daniel Baldwin & Ibrahim Ayad. All rights reserved.
//

#import "MasterGeoViewController.h"
#import "SearchGeoViewController.h"

@interface MasterGeoViewController ()

@end

@implementation MasterGeoViewController
@synthesize locationManager;

-(void) dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"geoPointAnnotiationUpdated" object:nil];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	self.navigationItem.leftBarButtonItem.enabled = NO;
    self.navigationItem.rightBarButtonItem.enabled = NO;
    
    [self.locationManager startUpdatingLocation];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(loadObjects) name:@"geoPointAnnotiationUpdated" object:nil];
}
-(BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation{
    return toInterfaceOrientation == UIInterfaceOrientationPortrait;

}





#pragma tableVIew
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
                      object:(PFObject *)object{
    static NSNumberFormatter *numberFormatter = nil;
    if (numberFormatter == nil) {
        numberFormatter = [[NSNumberFormatter alloc] init];
        numberFormatter.numberStyle = NSNumberFormatterDecimalStyle;
        numberFormatter.maximumFractionDigits = 3;
        }
    PFTableViewCell *cell = (PFTableViewCell*)[tableView dequeueReusableCellWithIdentifier:@"LocationCell"];
    //configure cell
    PFGeoPoint *geoPoint = object[@"location"];
    
    cell.textLabel.text = [numberFormatter stringFromNumber:object.updatedAt];
    NSString *string = [NSString stringWithFormat:@"%@, %@",
                       [numberFormatter stringFromNumber:[NSNumber numberWithDouble:geoPoint.latitude]], [numberFormatter stringFromNumber:[NSNumber numberWithDouble:geoPoint.longitude]]];
    
    cell.detailTextLabel.text = string;
    
    return cell;
}

#pragma LocationManager

-(CLLocationManager*) locationManager {
    if (locationManager !=nil) {
        return locationManager;
    }
    locationManager = [[CLLocationManager alloc] init];
    locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters;
    locationManager.delegate = self;
    locationManager.purpose = @"Your current location is used to demonstrate PFGeoPoint and Geo Queries.";
    
    return locationManager;
}
- (void)locationManager:(CLLocationManager *)manager
    didUpdateToLocation:(CLLocation *)newLocation
           fromLocation:(CLLocation *)oldLocation {
    self.navigationItem.leftBarButtonItem.enabled = YES;
    self.navigationItem.rightBarButtonItem.enabled = YES;
}

- (void)locationManager:(CLLocationManager *)manager
       didFailWithError:(NSError *)error {
    self.navigationItem.leftBarButtonItem.enabled = NO;
    self.navigationItem.rightBarButtonItem.enabled = NO;
}

#pragma SearchButton

- (IBAction)insertCurrentLocation:(id)sender {
    
    CLLocation *location = self.locationManager.location;
	if (!location) {
		return;
        CLLocationCoordinate2D coordinate = [location coordinate];
        PFGeoPoint *geoPoint = [PFGeoPoint geoPointWithLatitude:coordinate.latitude longitude:coordinate.longitude];
        PFObject *object = [PFObject objectWithClassName:@"Location"];
        [object setObject:geoPoint forKey:@"location"];
        [object saveEventually:^(BOOL succeeded, NSError *error) {
            if (succeeded) {
                // Reload the PFQueryTableViewController
                [self loadObjects];
            }
        }];
    }
}
@end
