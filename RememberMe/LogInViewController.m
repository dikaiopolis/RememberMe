//
//  LogInViewController.m
//  RememberMe
//
//  Created by Daniel Baldwin on 10/22/13.
//  Copyright (c) 2013 Daniel Baldwin & Ibrahim Ayad. All rights reserved.
//

#import "LogInViewController.h"
#import "UserProfileViewController.h"

@interface LogInViewController ()

@end

@implementation LogInViewController
@synthesize usernameTextField, passwordTextField, forgotPasswordButton, loginButton, addAccountButton, facebookLoginButton, splashScreenImageView;

-(void)viewDidLoad {

[[UIApplication sharedApplication] setStatusBarHidden:NO];

    [super viewDidLoad];
    [forgotPasswordButton setTransform:CGAffineTransformMakeRotation (-M_PI / 2)];
     forgotPasswordButton.layer.cornerRadius = 10; // this value vary as per your desire
    forgotPasswordButton.clipsToBounds = YES;
    loginButton.layer.cornerRadius = 10;
    loginButton.clipsToBounds = YES;
    
    addAccountButton.layer.cornerRadius = 10;
    addAccountButton.clipsToBounds = YES;
    
    facebookLoginButton.layer.cornerRadius = 10;
    facebookLoginButton.clipsToBounds = YES;
    usernameTextField.delegate = self;
    passwordTextField.delegate = self;
    

// Change the frame size to suit yours //



}

-(void)viewWillAppear:(BOOL)animated{
    [self.navigationController setNavigationBarHidden:YES];   //it hides  
}

-(void)viewWillDisappear:(BOOL)animated{
    [self.navigationController setNavigationBarHidden:NO];    // it shows
}


- (void)viewDidAppear:(BOOL)animated {
    [self checkStatus];
}

-(BOOL) textFieldShouldReturn:(UITextField *)textField{

    [textField resignFirstResponder];
    return YES;
}

- (IBAction)onForgotPasswordButtonPressed:(id)sender {

}

- (IBAction)onFBLoginButtonPressed:(id)sender {
    // Set permissions required from the facebook user account
    NSArray *permissionsArray = @[ @"basic_info", @"user_about_me", @"user_work_history", @"email"];
    
    // Login PFUser using facebook
    [PFFacebookUtils logInWithPermissions:permissionsArray block:^(PFUser *user, NSError *error) {
      // Hide loading indicator
        
        if (!user) {
            if (!error) {
                NSLog(@"Uh oh. The user cancelled the Facebook login.");
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Log In Error" message:@"Uh oh. The user cancelled the Facebook login." delegate:nil cancelButtonTitle:nil otherButtonTitles:@"Dismiss", nil];
                [alert show];
            } else {
                NSLog(@"Uh oh. An error occurred: %@", error);
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Log In Error" message:[error description] delegate:nil cancelButtonTitle:nil otherButtonTitles:@"Dismiss", nil];
                [alert show];
            }
        } else if (user.isNew) {
            NSLog(@"User with facebook signed up and logged in!");
            [self performSegueWithIdentifier:@"SegueToCurrentUserProfile" sender:self];
        } else {
            NSLog(@"User with facebook logged in!");
            [self performSegueWithIdentifier:@"SegueToCurrentUserProfile" sender:self];
        }
    }];
    

}

- (void)checkStatus {

//Checks to see if there is a user logged in and if there is performsSegue to that users homepage

    if ([PFUser currentUser]) {
    
        [self performSegueWithIdentifier:@"SegueToCurrentUserProfile" sender:self];
    } else {
    splashScreenImageView.hidden = YES;
    }
}




- (IBAction)onAddAccountButtonPressed:(id)sender {
}


- (IBAction)onSignInButtonPressed:(id)sender {
    
    NSString *user = usernameTextField.text;
    NSString *password = passwordTextField.text;
    
    if ([user length] < 2 || [password length] < 4) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Invalid Entry" message:@"Make sure you fill out all of the information!" delegate:self cancelButtonTitle:@"Okay" otherButtonTitles:nil];
        [alert show];
    } else {
        [PFUser logInWithUsernameInBackground:user password:password block:^(PFUser *user, NSError *error) {
            if (user) {
                [self performSegueWithIdentifier:@"SegueToCurrentUserProfile" sender:self];
            } else {
                NSLog(@"%@",error);
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Login Failed." message:@"Invalid Username and/or Password." delegate:self cancelButtonTitle:@"Okay" otherButtonTitles:nil];
                [alert show];
            }
        }];
    }

}
@end
