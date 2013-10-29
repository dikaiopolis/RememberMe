//
//  UserProfileViewController.h
//  RememberMe
//
//  Created by Daniel Baldwin on 10/23/13.
//  Copyright (c) 2013 Daniel Baldwin & Ibrahim Ayad. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface UserProfileViewController : UIViewController <UIImagePickerControllerDelegate>


@property (nonatomic, strong) CLLocationManager *locationManager;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *companyLabel;
@property (weak, nonatomic) IBOutlet UILabel *jobTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *emailLabel;
@property (weak, nonatomic) IBOutlet UILabel *phoneNumberLabel;

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@property UIImagePickerController *picker;


- (IBAction)onAddPhotoButtonPressed:(id)sender;


- (IBAction)onLogoutButtonPressed:(id)sender;

@end
