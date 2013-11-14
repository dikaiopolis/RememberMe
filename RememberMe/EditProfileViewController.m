//
//  EditProfileViewController.m
//  RememberMe
//
//  Created by Daniel Baldwin on 10/24/13.
//  Copyright (c) 2013 Daniel Baldwin & Ibrahim Ayad. All rights reserved.
//

#import "EditProfileViewController.h"
#import <Parse/Parse.h>

@interface EditProfileViewController ()

@end

@implementation EditProfileViewController
@synthesize nameTextField, companyTextField, jobTitleTextField, emailTextField, phoneNumberTextField, imageView, picker;


-(void)viewDidAppear:(BOOL)animated
{
    nameTextField.text = [[PFUser currentUser] objectForKey:@"name"];
    companyTextField.text = [[PFUser currentUser] objectForKey:@"company"];
    jobTitleTextField.text = [[PFUser currentUser] objectForKey:@"jobTitle"];
    emailTextField.text = [[PFUser currentUser] objectForKey:@"email"];
    phoneNumberTextField.text = [[PFUser currentUser] objectForKey:@"phoneNumber"];
    PFFile *imageFile = [[PFUser currentUser] objectForKey:@"picture"];
    
    [imageFile getDataInBackgroundWithBlock:^(NSData *data, NSError *error) {
        if (!error) {
            imageView.image = [UIImage imageWithData:data];
        }
    }];

    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onSaveButtonPressed:(id)sender {

    [[PFUser currentUser] setEmail:emailTextField.text];
    [PFUser currentUser][@"phoneNumber"] = phoneNumberTextField.text;
    [PFUser currentUser][@"company"] = companyTextField.text;
    [PFUser currentUser][@"jobTitle"] = jobTitleTextField.text;
    [PFUser currentUser][@"name"] = nameTextField.text;
    [[PFUser currentUser] saveInBackground];
    [self performSegueWithIdentifier:@"SegueFromEditVCtoUserProfileVC" sender:self];

}

- (IBAction)onChangePictureButtonPressed:(id)sender
{

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
