//
//  SavedUsersViewController.m
//  RememberMe
//
//  Created by Daniel Baldwin on 10/24/13.
//  Copyright (c) 2013 Daniel Baldwin & Ibrahim Ayad. All rights reserved.
//

#import "SavedUsersViewController.h"
#import "ImageCell.h"
#import "SavedUserDetailViewController.h"

@interface SavedUsersViewController ()

@property int rowNumber;

@end

@implementation SavedUsersViewController
@synthesize savedUsersArray, personToPass, rowNumber;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}


-(void)viewDidAppear:(BOOL)animated
{
    PFQuery *query = [PFQuery queryWithClassName:@"SavedUsersArray"];


[query whereKey:@"userSavingThis"  equalTo:[[PFUser currentUser] valueForKey:@"objectId"]];

savedUsersArray = [[NSMutableArray alloc] init];
savedUsersArray = [query findObjects].mutableCopy;
NSLog(@"%@", savedUsersArray);

}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{

return 1;
}

- (NSInteger)collectionView:(UICollectionView *)view numberOfItemsInSection:(NSInteger)section {

PFQuery *query = [PFQuery queryWithClassName:@"SavedUsersArray"];


[query whereKey:@"userSavingThis"  equalTo:[[PFUser currentUser] valueForKey:@"objectId"]];

savedUsersArray = [[NSMutableArray alloc] init];
savedUsersArray = [query findObjects].mutableCopy;
    return savedUsersArray.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {

PFQuery *query = [PFQuery queryWithClassName:@"SavedUsersArray"];


[query whereKey:@"userSavingThis"  equalTo:[[PFUser currentUser] valueForKey:@"objectId"]];

savedUsersArray = [[NSMutableArray alloc] init];
savedUsersArray = [query findObjects].mutableCopy;

    ImageCell *cell = (ImageCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"imageCell" forIndexPath:indexPath];

    PFObject *imageObject = [savedUsersArray objectAtIndex:indexPath.row];
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

if ([segue.identifier isEqualToString:@"SegueToSavedUserDVC"]) {

SavedUserDetailViewController *sudvc = [segue destinationViewController];
    PFQuery *query = [PFQuery queryWithClassName:@"SavedUsersArray"];


[query whereKey:@"userSavingThis"  equalTo:[[PFUser currentUser] valueForKey:@"objectId"]];

savedUsersArray = [[NSMutableArray alloc] init];
savedUsersArray = [query findObjects].mutableCopy;

//// Limit what could be a lot of points.
query.limit = 500;

//    NSIndexPath* indexPath = [_collectionView indexPathForCell:sender];

    PFObject *imageObject = [savedUsersArray objectAtIndex:rowNumber];
    PFFile *imageFile = [imageObject objectForKey:@"picture"];
    
    personToPass = [[Person alloc] init];
    
    
    NSData *data = [imageFile getData];
    UIImage *image = [UIImage imageWithData:data];
    personToPass.picture = image;
    personToPass.name = [imageObject objectForKey:@"name"];
    personToPass.userID = [imageObject valueForKey:@"objectId"];
    personToPass.jobTitle = [imageObject objectForKey:@"jobTitle"];
    personToPass.company = [imageObject objectForKey:@"company"];
    personToPass.notes = [imageObject objectForKey:@"notes"];
    sudvc.person = personToPass;
    
    NSLog(@"%@", personToPass.name);
    
 }
    
}


-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    rowNumber = (int) indexPath.row;
    [self performSegueWithIdentifier:@"SegueToSavedUserDVC" sender:self];
}

@end
