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
@synthesize usernameTextField, passwordTextField, forgotPasswordButton, loginButton, addAccountButton, facebookLoginButton;

-(void)viewDidLoad {
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

    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:73 green:58 blue:68 alpha:0];
    
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];



}

- (void)viewDidAppear:(BOOL)animated {
    [self checkStatus];
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
    
    NSLog(@"%@", [PFUser currentUser]);
        [self performSegueWithIdentifier:@"SegueToCurrentUserProfile" sender:self];
    }
}


#pragma mark Parse Delegate Methods
// Sent to the delegate to determine whether the log in request should be submitted to the server.
- (BOOL)logInViewController:(PFLogInViewController *)logInController shouldBeginLogInWithUsername:(NSString *)username password:(NSString *)password {
    // Check if both fields are completed
    if (username && password && username.length != 0 && password.length != 0) {
        return YES; // Begin login process
    }
     
    [[[UIAlertView alloc] initWithTitle:@"Missing Information"
                          message:@"Make sure you fill out all of the information!"
                          delegate:nil
                          cancelButtonTitle:@"ok"
                          otherButtonTitles:nil] show];
    return NO; // Interrupt login process
}

// Sent to the delegate when a PFUser is logged in.
- (void)logInViewController:(PFLogInViewController *)logInController didLogInUser:(PFUser *)user {
    [self dismissViewControllerAnimated:YES completion:NULL];
}

// Sent to the delegate when the log in attempt fails.
- (void)logInViewController:(PFLogInViewController *)logInController didFailToLogInWithError:(NSError *)error {
    NSLog(@"Failed to log in...");
}
 
// Sent to the delegate when the log in screen is dismissed.
- (void)logInViewControllerDidCancelLogIn:(PFLogInViewController *)logInController {
    [self.navigationController popViewControllerAnimated:YES];
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
