//
//  WhoIsNearMeViewController.m
//  RememberMe
//
//  Created by Daniel Baldwin on 10/24/13.
//  Copyright (c) 2013 Daniel Baldwin & Ibrahim Ayad. All rights reserved.
//

#import "AppDelegate.h"
#import "WhoIsNearMeViewController.h"
#import "Person.h"


@interface WhoIsNearMeViewController (){
CLLocationManager *locationManager;
NSMutableDictionary *peopleNearMeDictionary;
}

@end

@implementation WhoIsNearMeViewController
@synthesize mapView, span;

-(void)viewDidLoad
{
    [super viewDidLoad];


}

-(void)viewDidAppear:(BOOL)animated
{

    CLLocation *location = [[CLLocation alloc] init];
    location = mapView.userLocation.location;
    
    CLLocationCoordinate2D location2d;
    location2d.latitude = location.coordinate.latitude;
    location2d.longitude = location.coordinate.longitude;
    
    span.latitudeDelta = 0.01;
    span.longitudeDelta = 0.01;
    
    MKCoordinateRegion region;
    region = MKCoordinateRegionMake(location2d, span);
    mapView.region = region;


[locationManager startUpdatingLocation];
//    CLLocation *location = locationManager.location;
//    CLLocationCoordinate2D coordinate = [location coordinate];
//    
//    NSLog(@"This is the location %@", location);
//    PFGeoPoint *geoPoint = [PFGeoPoint geoPointWithLatitude:coordinate.latitude
//                                              longitude:coordinate.longitude];
//    
//    PFObject *object = [PFObject objectWithClassName:@"Location"];
//    [object setObject:geoPoint forKey:@"location"];
//    [object saveEventually:^(BOOL succeeded, NSError *error) {
//        if (succeeded) {
//    // Reload the PFQueryTableViewController
////    [self loadObjects];
//  }
//}];
//

//
//[locationManager startUpdatingLocation];
//    CLLocationCoordinate2D mobileMakersLocation;
//    mobileMakersLocation.latitude = 41.893740;
//    mobileMakersLocation.longitude = -87.635330;
//    
//    
//    span.latitudeDelta = 0.01;
//    span.longitudeDelta = 0.01;
//    
//    MKCoordinateRegion region;
//    region = MKCoordinateRegionMake(mobileMakersLocation, span);
//    mapView.region = region;
//    
//    
//    MKPointAnnotation *point = [[MKPointAnnotation alloc] init];
//    point.coordinate = mobileMakersLocation;
//    point.title = @"Mobile Makers Academy";
//    
//    mapView.centerCoordinate = mobileMakersLocation;
//    [mapView addAnnotation:point];
//    
//
//    
//    region = MKCoordinateRegionMake(mobileMakersLocation, span);
//    mapView.region = region;
    
    peopleNearMeDictionary = [[NSMutableDictionary alloc] init];
    
//    Person *firstPerson = [[Person alloc] init];
//    Person *secondPerson = [[Person alloc] init];
//    firstPerson.name = @"John";
//    secondPerson.name = @"Nicole";
//    firstPerson.picture = [UIImage imageNamed:@"Marcel_Claude_headshot.jpg"];
//    secondPerson.picture = [UIImage imageNamed:@"Nichole-Galicia-Headshot.png"];
    
    NSString *firstPerson = [[NSString alloc] init];
    firstPerson = @"John";
    NSString *secondPerson = [[NSString alloc] init];
    secondPerson = @"Nicole";
    
    NSMutableArray *firstArray = [[NSMutableArray alloc] init];
    NSMutableArray *secondArray = [[NSMutableArray alloc] init];
    
    UIImage *firstPersonImage = [UIImage imageNamed:@"Marcel_Claude_headshot.jpg"];
    UIImage *secondPersonImage = [UIImage imageNamed:@"Nichole-Galicia-Headshot.png"];
    
    peopleNearMeDictionary = [[NSMutableDictionary alloc] initWithObjectsAndKeys:firstPerson, @"name", secondPerson, @"name" , firstPersonImage, @"picture", secondPersonImage, @"picture", nil];
    


}

-(void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    
    CLLocationCoordinate2D location2d;
    location2d.latitude = newLocation.coordinate.latitude;
    location2d.longitude = newLocation.coordinate.longitude;
    
    span.latitudeDelta = 0.01;
    span.longitudeDelta = 0.01;
    
    MKCoordinateRegion region;
    region = MKCoordinateRegionMake(location2d, span);
    mapView.region = region;

    
}

 -(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
 {
       
    NSString *cellIdentifier = @"Person";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if(!cell){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
    }
    
    cell.textLabel.text = @"John";
    
    cell.imageView.image = [UIImage imageNamed:@"Marcel_Claude_headshot.jpg"];

    return cell;


 }



 -(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
 {
   return 1;
 }

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
[self performSegueWithIdentifier:@"SegueToPersonDetailVC" sender:self];

}

#pragma mark CLLocationManagerDelegate
-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations{
    NSLog(@"Location changed [%i] %@}", locations.count, [locations objectAtIndex:0]);
}

-(void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error{
    NSLog(@"%@", error);
}




- (IBAction)onButtonPressed:(id)sender {
//    locationManager = [[CLLocationManager alloc] init];
//    locationManager.delegate = self;
//    mapView.showsUserLocation = YES;
//    mapView.delegate = self;
//    
//    MKPointAnnotation *point = [[MKPointAnnotation alloc] init];
//    point.coordinate = [locationManager location].coordinate;
//    point.title = @"You are here";
//    
//    NSLog(@"coordinates are %@", [locationManager location].coordinate);
//    
//    mapView.centerCoordinate = [locationManager location].coordinate;
//    [mapView addAnnotation:point];
//[locationManager startUpdatingLocation];
}

- (IBAction)onRefreshButtonPressed:(id)sender {
   CLLocation *location = [[CLLocation alloc] init];
    location = mapView.userLocation.location;
    
    CLLocationCoordinate2D location2d;
    location2d.latitude = location.coordinate.latitude;
    location2d.longitude = location.coordinate.longitude;
    
    span.latitudeDelta = 0.01;
    span.longitudeDelta = 0.01;
    
    MKCoordinateRegion region;
    region = MKCoordinateRegionMake(location2d, span);
    mapView.region = region;


}
@end
