//
//  UserProfileViewController.m
//  RememberMe
//
//  Created by Daniel Baldwin on 10/23/13.
//  Copyright (c) 2013 Daniel Baldwin & Ibrahim Ayad. All rights reserved.
//

#import "UserProfileViewController.h"
#import <FacebookSDK/FacebookSDK.h>
#import "ImageCell.h"
#import "PersonDetailViewController.h"
@interface UserProfileViewController()
  @property int rowNumber;

@end
@implementation UserProfileViewController
@synthesize nameLabel, companyLabel, jobTitleLabel, picker, imageView, imageData, usersArray, mapView, personToPass, cellIndexPath, rowNumber;

- (void)viewDidLoad
{


    [super viewDidLoad];
	// Do any additional setup after loading the view.
    //

    

    
    // ...
//    // Create request for user's Facebook data
//    FBRequest *request = [FBRequest requestForMe];
//    
//    // Send request to Facebook
//    [request startWithCompletionHandler:^(FBRequestConnection *connection, id result, NSError *error) {
//        if (!error) {
//            // result is a dictionary with the user's Facebook data
//            NSDictionary *userData = (NSDictionary *)result;
//            
//            NSString *facebookID = userData[@"id"];
//            NSString *name = userData[@"name"];
//            
//            // Download the user's facebook profile picture
//            imageData = [[NSMutableData alloc] init]; // the data will be loaded in here
//            
//            // URL should point to https://graph.facebook.com/{facebookId}/picture?type=large&return_ssl_resources=1
//            NSURL *pictureURL = [NSURL URLWithString:[NSString stringWithFormat:@"https://graph.facebook.com/%@/picture?type=large&return_ssl_resources=1", facebookID]];
//            
//            NSMutableURLRequest *urlRequest = [NSMutableURLRequest requestWithURL:pictureURL
//                                                                      cachePolicy:NSURLRequestUseProtocolCachePolicy
//                                                                  timeoutInterval:2.0f];
//            // Run network request asynchronously
//            NSURLConnection *urlConnection = [[NSURLConnection alloc] initWithRequest:urlRequest delegate:self];
//            
//            
//            // Now add the data to the UI elements
//            nameLabel.text = name;
//            
//        }
//    }];
    
}


-(void)viewDidAppear:(BOOL)animated
{

       nameLabel.text = [[PFUser currentUser] objectForKey:@"name"];
       companyLabel.text = [[PFUser currentUser] objectForKey:@"company"];
       jobTitleLabel.text = [[PFUser currentUser] objectForKey:@"jobTitle"];
//       emailLabel.text = [[PFUser currentUser] objectForKey:@"email"];
//       phoneNumberLabel.text = [[PFUser currentUser] objectForKey:@"phoneNumber"];
           PFFile *imageFile = [[PFUser currentUser] objectForKey:@"picture"];
    
    [imageFile getDataInBackgroundWithBlock:^(NSData *data, NSError *error) {
        if (!error) {
            imageView.image = [UIImage imageWithData:data];
        }
    }];
    PFUser *user = [PFUser currentUser];
    NSLog(@"This is the location %f, %f", mapView.userLocation.coordinate.latitude, mapView.userLocation.coordinate.longitude );
     user[@"location"] = [PFGeoPoint geoPointWithLatitude:mapView.userLocation.coordinate.latitude longitude:mapView.userLocation.coordinate.longitude];;
    
      [[PFUser currentUser] saveInBackground];
    
    

//// Create a query for places
//PFQuery *query = [PFQuery queryWithClassName:@"UserPhoto"];
//
//
//[query whereKey:@"location" nearGeoPoint:userGeoPoint withinKilometers:0.05];
//
//
////// Limit what could be a lot of points.
//query.limit = 50;
////// Final list of objects
////
//
//usersArray = [[NSMutableArray alloc] init];
//usersArray = [query findObjects].mutableCopy;

}
//
//// Called every time a chunk of the data is received
//- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
//    [imageData appendData:data]; // Build the image
//}
// 
//// Called when the entire image is finished downloading
//- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
//    // Set the image in the header imageView
//    imageView.image = [UIImage imageWithData:imageData];
//}
//


-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{

return 1;
}

- (NSInteger)collectionView:(UICollectionView *)view numberOfItemsInSection:(NSInteger)section {
    PFGeoPoint *userGeoPoint = [PFGeoPoint geoPointWithLatitude:mapView.userLocation.coordinate.latitude longitude:mapView.userLocation.coordinate.longitude];

PFQuery *query = [PFUser query];


[query whereKey:@"location" nearGeoPoint:userGeoPoint withinKilometers:0.05];


//// Limit what could be a lot of points.
query.limit = 50;
//// Final list of objects
//

usersArray = [[NSMutableArray alloc] init];
usersArray = [query findObjects].mutableCopy;
    return usersArray.count;
}

-(ImageCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {

    PFGeoPoint *userGeoPoint = [PFGeoPoint geoPointWithLatitude:mapView.userLocation.coordinate.latitude longitude:mapView.userLocation.coordinate.longitude];
    
PFQuery *locationQuery = [PFUser query];


[locationQuery whereKey:@"location" nearGeoPoint:userGeoPoint withinKilometers:0.05];

//
//PFQuery *userQuery = [PFUser query];
//[userQuery whereKey:@"objectId" notEqualTo:[[PFUser currentUser] objectForKey:@"objectId"]];
//
//PFQuery *combinedQuery = [PFQuery orQueryWithSubqueries:@[locationQuery, userQuery]];

//// Limit what could be a lot of points.
locationQuery.limit = 50;
//// Final list of objects

usersArray = [[NSMutableArray alloc] init];
usersArray = [locationQuery findObjects].mutableCopy;

    ImageCell *cell = (ImageCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"imageCell" forIndexPath:indexPath];

    PFObject *imageObject = [usersArray objectAtIndex:indexPath.row];
    PFFile *imageFile = [imageObject objectForKey:@"picture"];
    
    [imageFile getDataInBackgroundWithBlock:^(NSData *data, NSError *error) {
        if (!error) {
            cell.imageView.image = [UIImage imageWithData:data];
        }
    }];
    
    NSString *userName = [[NSString alloc] init];
    userName = [imageObject objectForKey:@"name"];
    
    cell.label.text = userName;
    
    return cell;
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(ImageCell *)sender
{

if ([segue.identifier isEqualToString:@"SegueToDetailVC"]) {

PersonDetailViewController *pdvc = [segue destinationViewController];

 PFGeoPoint *userGeoPoint = [PFGeoPoint geoPointWithLatitude:mapView.userLocation.coordinate.latitude longitude:mapView.userLocation.coordinate.longitude];
 
     
PFQuery *query = [PFUser query];

[query whereKey:@"location" nearGeoPoint:userGeoPoint withinKilometers:0.05];

//// Limit what could be a lot of points.
query.limit = 50;
//// Final list of objects

usersArray = [[NSMutableArray alloc] init];
usersArray = [query findObjects].mutableCopy;

NSLog(@"semder %@", sender);

//    NSIndexPath* indexPath = [_collectionView indexPathForCell:sender];

    PFObject *imageObject = [usersArray objectAtIndex:rowNumber];
    PFFile *imageFile = [imageObject objectForKey:@"picture"];
    
    personToPass = [[Person alloc] init];
    
    NSData *data = [imageFile getData];
    UIImage *image = [UIImage imageWithData:data];
    
    

    personToPass.picture = image;
    personToPass.name = [imageObject objectForKey:@"name"];
    personToPass.userID = [imageObject valueForKey:@"objectId"];
    personToPass.jobTitle = [imageObject objectForKey:@"jobTitle"];
    personToPass.company = [imageObject objectForKey:@"company"];
    pdvc.person = personToPass;
    
    NSLog(@"%@", personToPass.name);
    
 }
    
}


-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    rowNumber = (int) indexPath.row;
    NSLog(@"Index path %@", indexPath);
    [self performSegueWithIdentifier:@"SegueToDetailVC" sender:self];
}

- (IBAction)onLogoutButtonPressed:(id)sender {

    PFUser *user = [PFUser currentUser];
    PFGeoPoint *userGeoPoint = [PFGeoPoint geoPointWithLatitude:5 longitude:5];
    user[@"location"] = userGeoPoint;
    [[PFUser currentUser] save];
    [PFUser logOut];
    [self performSegueWithIdentifier:@"LogOutSegue" sender:self];
}

- (IBAction)onRefreshButtonPressed:(id)sender {

    PFUser *user = [PFUser currentUser];
     user[@"location"] = [PFGeoPoint geoPointWithLatitude:mapView.userLocation.coordinate.latitude longitude:mapView.userLocation.coordinate.longitude];;
    
      [[PFUser currentUser] saveInBackground];

[_collectionView reloadData];

}
@end
