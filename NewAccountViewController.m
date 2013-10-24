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
@synthesize fullNameTextField,userNameTextField,passwordTextField,emailTextField,companyTextField;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    fullNameTextField.text = @"";
    userNameTextField.text= @"";
    passwordTextField.text = @"";
    emailTextField.text = @"";
    companyTextField.text= @"";
}

- (void)myMethod {
    PFUser *user = [PFUser user];
    user.username = @"";
    user.password = @"";
    user.email = @"";
    user[@"Company"] = @"";
    user[@"Full Name"]= @"";
}


- (void)logInViewController:(PFLogInViewController *)logInController didLogInUser:(PFUser *)user {
    [self dismissViewControllerAnimated:YES completion:NULL];
}




- (IBAction)pushToParse:(id)sender {
       
    
}

@end