//
//  UserProfileViewController.m
//  RememberMe
//
//  Created by Daniel Baldwin on 10/23/13.
//  Copyright (c) 2013 Daniel Baldwin & Ibrahim Ayad. All rights reserved.
//

#import "UserProfileViewController.h"

@interface UserProfileViewController ()

@end

@implementation UserProfileViewController
@synthesize nameLabel, companyLabel, jobTitleLabel, emailLabel, phoneNumberLabel;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    nameLabel.text = [[PFUser currentUser] objectForKey:@"username"];
    companyLabel.text = [[PFUser currentUser] objectForKey:@"company"];
    jobTitleLabel.text = [[PFUser currentUser] objectForKey:@"jobTitle"];
    emailLabel.text = [[PFUser currentUser] objectForKey:@"email"];
    phoneNumberLabel.text = [[PFUser currentUser] objectForKey:@"phoneNumber"];
//    pictureView.image = [[PFUser currentUser] objectForKey:@"picture"];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onLogoutButtonPressed:(id)sender {
[PFUser logOut];
[self performSegueWithIdentifier:@"LogOutSegue" sender:self];
}
@end
