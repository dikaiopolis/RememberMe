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
@synthesize fullNameTextField,userNameTextField,passwordTextField,emailTextField,companyTextField, jobTitleTextField, imageView, picker;

- (void)myMethod {


////



    PFUser *user = [PFUser user];
    user.username = userNameTextField.text;
    user.password = passwordTextField.text;
    user.email = emailTextField.text;
    user[@"name"] = fullNameTextField.text;
//    user[@"phoneNumber"] = phoneNumberTextField.text;
    user[@"company"] = companyTextField.text;
    user[@"jobTitle"] = jobTitleTextField.text;
    user[@"realName"] = fullNameTextField.text;
    [[PFUser currentUser] saveInBackground];

    [user signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
      if (!error) {
        [self performSegueWithIdentifier:@"NewAccountCreatedSegue" sender:self];
        } else {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Save failed." message:@"Fill out the information again." delegate:self cancelButtonTitle:@"Okay" otherButtonTitles:nil];
                [alert show];
                }
        
    }];
    
}


-(void)viewDidLoad
{
    [super viewDidLoad];

}


-(BOOL) textFieldShouldReturn:(UITextField *)textField{

    [textField resignFirstResponder];
    return YES;
}

- (IBAction)onSaveButtonPressed:(id)sender {

if ([passwordTextField.text isEqualToString:@""] || ([userNameTextField.text isEqualToString:@""]) || ([emailTextField.text isEqualToString:@""])){
UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Save failed." message:@"Fill out the text fields." delegate:self cancelButtonTitle:@"Okay" otherButtonTitles:nil];
                [alert show];} else
    [self myMethod];
}

- (IBAction)onAddPhotoButtonPressed:(id)sender {
    picker = [UIImagePickerController new];
    picker.delegate = self;
    
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        picker.sourceType = UIImagePickerControllerSourceTypeCamera;
    }else{
        picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    }
    [self presentViewController:picker animated:YES completion:nil];
}

-(void) imagePickerController:(UIImagePickerController *)Picker {
    [Picker dismissViewControllerAnimated:YES completion:Nil];
}

-(void) imagePickerController:(UIImagePickerController *)Picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    
    UIImage *image = [info objectForKey:@"UIImagePickerControllerOriginalImage"];
    imageView.image = image;
    
    [Picker dismissViewControllerAnimated:YES completion:Nil];
    
    NSData *pictureImageData = UIImageJPEGRepresentation(image, 0.05f);
    
    [self uploadImage:pictureImageData];
    
}
-(void)uploadImage:(NSData *)image{
    NSData *pictureImageData = UIImageJPEGRepresentation(imageView.image, 0.5);
    PFFile *anImageFile = [PFFile fileWithName:@"Image.jpg" data:pictureImageData];
    [anImageFile saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (!error) {
            
             PFUser *user = [PFUser currentUser];
             user[@"picture"] = anImageFile;
             [[PFUser currentUser] saveInBackground];
        }
    }];
    
}

@end