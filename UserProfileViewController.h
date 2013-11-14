//
//  UserProfileViewController.h
//  RememberMe
//
//  Created by Daniel Baldwin on 10/23/13.
//  Copyright (c) 2013 Daniel Baldwin & Ibrahim Ayad. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>
#import "ImageCell.h"
#import "Person.h"

@interface UserProfileViewController : UIViewController < CLLocationManagerDelegate,MKMapViewDelegate, UICollectionViewDataSource, UICollectionViewDelegate>


@property (nonatomic, strong) CLLocationManager *locationManager;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *companyLabel;
@property (weak, nonatomic) IBOutlet UILabel *jobTitleLabel;
@property (weak, nonatomic) IBOutlet MKMapView *mapView;

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) NSMutableData *imageData;
@property (strong, nonatomic) NSMutableArray *usersArray;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (strong, nonatomic) Person *personToPass;
@property (strong, nonatomic) NSIndexPath *cellIndexPath;

@property UIImagePickerController *picker;

- (IBAction)onRefreshButtonPressed:(id)sender;

- (IBAction)onLogoutButtonPressed:(id)sender;

@end
