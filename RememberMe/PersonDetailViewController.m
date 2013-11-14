//
//  PersonDetailViewController.m
//  RememberMe
//
//  Created by Daniel Baldwin on 10/31/13.
//  Copyright (c) 2013 Daniel Baldwin & Ibrahim Ayad. All rights reserved.
//

#import "PersonDetailViewController.h"
#import "Person.h"
#import <Parse/Parse.h>


@interface PersonDetailViewController ()

@end

@implementation PersonDetailViewController
@synthesize personImageView, personNameLabel, notesTextView, person, companyLabel, jobTitleLabel;


- (void)viewDidLoad
{

NSLog(@"herename is %@", person.name);
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    personNameLabel.text = person.name;
    personImageView.image = person.picture;
    companyLabel.text = person.company;
    jobTitleLabel.text = person.jobTitle;
    
}

-(void)viewDidAppear:(BOOL)animated
{

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onSaveUserButtonPressed:(id)sender {


PFObject *savedPerson = [PFObject objectWithClassName:@"SavedUsersArray"];
savedPerson[@"name"] = person.name;
savedPerson[@"company"] = person.company;
savedPerson[@"jobTitle"] = person.jobTitle;
savedPerson[@"userId"] = person.userID;
savedPerson[@"notes"] = notesTextView.text;
//savedPerson[@"userSavingThis"] = user;
savedPerson[@"userSavingThis"] = [[PFUser currentUser] valueForKey:@"objectId"];

  NSData *pictureImageData = UIImagePNGRepresentation(person.picture);
    PFFile *anImageFile = [PFFile fileWithName:@"Image.jpg" data:pictureImageData];
    [anImageFile saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (!error) {
            
             savedPerson[@"picture"] = anImageFile;
            [savedPerson saveInBackground];

        }
    }];


//savedPerson[@"userSavingThis"] = [[PFUser currentUser] objectForKey:@"objectId"];

[savedPerson saveInBackground];

[[[UIAlertView alloc] initWithTitle:@"User Saved"
                          message:@"User has been saved!"
                          delegate:nil
                          cancelButtonTitle:@"Ok"
                          otherButtonTitles:nil] show];
    
}
- (IBAction)onBackButtonPressed:(id)sender {
    [self performSegueWithIdentifier:@"SegueFromDVCtoUP" sender:self];
}
@end
