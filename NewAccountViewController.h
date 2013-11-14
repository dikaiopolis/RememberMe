//
//  NewAccountViewController.h
//  RememberMe
//
//  Created by Ibrahim Ayad on 10/22/13.
//  Copyright (c) 2013 Daniel Baldwin & Ibrahim Ayad. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>


@interface NewAccountViewController : UIViewController <PFLogInViewControllerDelegate, PFSignUpViewControllerDelegate, UIImagePickerControllerDelegate, UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *fullNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *userNameTextField;

@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (weak, nonatomic) IBOutlet UITextField *emailTextField;

@property (weak, nonatomic) IBOutlet UITextField *companyTextField;

@property (weak, nonatomic) IBOutlet UITextField *jobTitleTextField;

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@property UIImagePickerController *picker;

- (IBAction)onSaveButtonPressed:(id)sender;


- (IBAction)onAddPhotoButtonPressed:(id)sender;


@end

