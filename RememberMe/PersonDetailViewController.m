//
//  PersonDetailViewController.m
//  RememberMe
//
//  Created by Daniel Baldwin on 10/31/13.
//  Copyright (c) 2013 Daniel Baldwin & Ibrahim Ayad. All rights reserved.
//

#import "PersonDetailViewController.h"

@interface PersonDetailViewController ()

@end

@implementation PersonDetailViewController
@synthesize personImageView, personNameLabel, notesTextView, saveUserButton;


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    personNameLabel.text = @"John";
    personImageView.image = [UIImage imageNamed:@"Marcel_Claude_headshot.jpg"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onSaveUserButtonPressed:(id)sender {
[[[UIAlertView alloc] initWithTitle:@"User Saved"
                          message:@"User has been saved!"
                          delegate:nil
                          cancelButtonTitle:@"Ok"
                          otherButtonTitles:nil] show];
saveUserButton.hidden = YES;

}

- (IBAction)onContactInfoButtonPressed:(id)sender {
}

- (IBAction)onSendYourContactInfoButtonPressed:(id)sender {
}

- (IBAction)askForContactInfo:(id)sender {
}
@end
