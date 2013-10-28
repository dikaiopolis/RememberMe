//
//  NewAccountViewController.m
//  RememberMe
//
//  Created by Ibrahim Ayad on 10/22/13.
//  Copyright (c) 2013 Daniel Baldwin & Ibrahim Ayad. All rights reserved.
//

#import "NewAccountViewController.h"

@interface NewAccountViewController ()

@end


@implementation NewAccountViewController
@synthesize fullNameTextField,userNameTextField,passwordTextField,emailTextField,companyTextField, phoneNumberTextField, jobTitleTextField;

- (void)myMethod {
    PFUser *user = [PFUser user];
    user.username = userNameTextField.text;
    user.password = passwordTextField.text;
    user.email = emailTextField.text;
    user[@"phoneNumber"] = phoneNumberTextField.text;
    user[@"company"] = companyTextField.text;
    user[@"jobTitle"] = jobTitleTextField.text;
    user[@"realName"] = fullNameTextField.text;
//    
//    UIImage *picture = [UIImage imageNamed:@"Marcel_Claude_headshot.jpg"];
//    user[@"picture"] = picture;
    

    [user signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
      if (!error) {
        [self performSegueWithIdentifier:@"NewAccountCreatedSegue" sender:self];
        } else {
          NSString *errorString = [error userInfo][@"error"];
          // Show the errorString somewhere and let the user try again.
      }
    }];
}


-(void)viewDidLoad
{
    [super viewDidLoad];

}



- (IBAction)onCreateAccountButtonPressed:(id)sender {
[self myMethod];
}
@end