//
//  LogInViewController.h
//  RememberMe
//
//  Created by Daniel Baldwin on 10/22/13.
//  Copyright (c) 2013 Daniel Baldwin & Ibrahim Ayad. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import <FacebookSDK/FacebookSDK.h>

@interface LogInViewController : UIViewController <PFLogInViewControllerDelegate, PFSignUpViewControllerDelegate>

@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (weak, nonatomic) IBOutlet UITextField *usernameTextField;

@property (weak, nonatomic) IBOutlet UIButton *loginButton;
@property (weak, nonatomic) IBOutlet UIButton *facebookLoginButton;

@property (weak, nonatomic) IBOutlet UIButton *addAccountButton;

- (IBAction)onAddAccountButtonPressed:(id)sender;
- (IBAction)onSignInButtonPressed:(id)sender;

@property (weak, nonatomic) IBOutlet UIButton *forgotPasswordButton;


- (IBAction)onForgotPasswordButtonPressed:(id)sender;

- (IBAction)onFBLoginButtonPressed:(id)sender;

-(void)checkStatus;

@end
