//
//  WhoIsNearMeViewController.h
//  RememberMe
//
//  Created by Daniel Baldwin on 10/24/13.
//  Copyright (c) 2013 Daniel Baldwin & Ibrahim Ayad. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <Parse/Parse.h>
#import <CoreLocation/CoreLocation.h>



@interface WhoIsNearMeViewController : UIViewController <CLLocationManagerDelegate, MKMapViewDelegate, UITableViewDataSource, UITableViewDelegate>

@property (nonatomic) MKCoordinateSpan span;

// CLLocationManagerDelegate methods:
- (void)locationManager:(CLLocationManager *)manager
    didUpdateToLocation:(CLLocation *)newLocation
           fromLocation:(CLLocation *)oldLocation;

-(void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error;

@property (weak, nonatomic) IBOutlet MKMapView *mapView;
- (IBAction)onButtonPressed:(id)sender;

- (IBAction)onRefreshButtonPressed:(id)sender;

@end

