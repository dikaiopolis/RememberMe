//
//  ResetPasswordViewController.m
//  RememberMe
//
//  Created by Daniel Baldwin on 10/27/13.
//  Copyright (c) 2013 Daniel Baldwin & Ibrahim Ayad. All rights reserved.
//

#import "ResetPasswordViewController.h"
#import <Parse/Parse.h>

@interface ResetPasswordViewController ()

@end

@implementation ResetPasswordViewController
@synthesize emailAddressTextField;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onResetButtonPressed:(id)sender {
NSString *email = [NSString stringWithFormat:@"%@", emailAddressTextField.text];
[PFUser requestPasswordResetForEmailInBackground:email];
}
@end
