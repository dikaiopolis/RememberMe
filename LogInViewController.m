//
//  LogInViewController.m
//  RememberMe
//
//  Created by Daniel Baldwin on 10/22/13.
//  Copyright (c) 2013 Daniel Baldwin & Ibrahim Ayad. All rights reserved.
//

#import "LogInViewController.h"

@interface LogInViewController ()

@end

@implementation LogInViewController
@synthesize usernameTextField, passwordTextField;

-(void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewDidAppear:(BOOL)animated {
    [self checkStatus];
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

- (IBAction)onLinkedInButtonPressed:(id)sender {
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
