//
//  EditProfileViewController.h
//  RememberMe
//
//  Created by Daniel Baldwin on 10/24/13.
//  Copyright (c) 2013 Daniel Baldwin & Ibrahim Ayad. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EditProfileViewController : UIViewController <UIImagePickerControllerDelegate>

@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextField *companyTextField;
@property (weak, nonatomic) IBOutlet UITextField *jobTitleTextField;
@property (weak, nonatomic) IBOutlet UITextField *emailTextField;
@property (weak, nonatomic) IBOutlet UITextField *phoneNumberTextField;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@property UIImagePickerController *picker;


- (IBAction)onSaveButtonPressed:(id)sender;

- (IBAction)onChangePictureButtonPressed:(id)sender;

@end
