//
//  EditProfileViewController.m
//  RememberMe
//
//  Created by Daniel Baldwin on 10/24/13.
//  Copyright (c) 2013 Daniel Baldwin & Ibrahim Ayad. All rights reserved.
//

#import "EditProfileViewController.h"
#import <Parse/Parse.h>

@interface EditProfileViewController ()

@end

@implementation EditProfileViewController
@synthesize nameTextField, companyTextField, jobTitleTextField, emailTextField, phoneNumberTextField;


-(void)viewDidAppear:(BOOL)animated
{
    nameTextField.text = [[PFUser currentUser] objectForKey:@"name"];
    companyTextField.text = [[PFUser currentUser] objectForKey:@"company"];
    jobTitleTextField.text = [[PFUser currentUser] objectForKey:@"jobTitle"];
    emailTextField.text = [[PFUser currentUser] objectForKey:@"email"];
    phoneNumberTextField.text = [[PFUser currentUser] objectForKey:@"phoneNumber"];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onSaveButtonPressed:(id)sender {

    [[PFUser currentUser] setEmail:emailTextField.text];
    [PFUser currentUser][@"phoneNumber"] = phoneNumberTextField.text;
    [PFUser currentUser][@"company"] = companyTextField.text;
    [PFUser currentUser][@"jobTitle"] = jobTitleTextField.text;
    [PFUser currentUser][@"realName"] = nameTextField.text;
    [[PFUser currentUser] saveInBackground];
    [self performSegueWithIdentifier:@"SegueFromEditVCtoUserProfileVC" sender:self];

}

@end
