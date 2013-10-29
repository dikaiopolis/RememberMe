//
//  UserProfileViewController.m
//  RememberMe
//
//  Created by Daniel Baldwin on 10/23/13.
//  Copyright (c) 2013 Daniel Baldwin & Ibrahim Ayad. All rights reserved.
//

#import "UserProfileViewController.h"
#import <FacebookSDK/FacebookSDK.h>

@implementation UserProfileViewController
@synthesize nameLabel, companyLabel, jobTitleLabel, emailLabel, phoneNumberLabel, picker, imageView;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    nameLabel.text = [[PFUser currentUser] objectForKey:@"name"];
    companyLabel.text = [[PFUser currentUser] objectForKey:@"company"];
    jobTitleLabel.text = [[PFUser currentUser] objectForKey:@"jobTitle"];
    emailLabel.text = [[PFUser currentUser] objectForKey:@"email"];
    phoneNumberLabel.text = [[PFUser currentUser] objectForKey:@"phoneNumber"];
 }

//Adds a new photo from the phone's gallery or from the camera
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
    
    NSData *imageData = UIImageJPEGRepresentation(image, 0.05f);
    
    [self uploadImage:imageData];
}
-(void)uploadImage:(UIImagePickerController*)image{
    NSData *imageData = UIImagePNGRepresentation(imageView.image);
    PFFile *imageFile = [PFFile fileWithName:@"Image.jpg" data:imageData];
    [imageFile saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (!error) {
        
            PFObject *userPhoto = [PFObject objectWithClassName:@"UserPhoto"];
            [userPhoto setObject:imageFile forKey:@"picture"];
            userPhoto.ACL = [PFACL ACLWithUser:[PFUser currentUser]];
            
            PFUser *user = [PFUser currentUser];
            [userPhoto setObject:user forKey:@"picture"];
            [userPhoto saveInBackground];
        }
    }];
    
}

- (IBAction)onLogoutButtonPressed:(id)sender {
    [PFUser logOut];
    [self performSegueWithIdentifier:@"LogOutSegue" sender:self];
}
@end
