//
//  PersonDetailViewController.h
//  RememberMe
//
//  Created by Daniel Baldwin on 10/31/13.
//  Copyright (c) 2013 Daniel Baldwin & Ibrahim Ayad. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PersonDetailViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *personNameLabel;
@property (weak, nonatomic) IBOutlet UIImageView *personImageView;
@property (weak, nonatomic) IBOutlet UITextView *notesTextView;
@property (weak, nonatomic) IBOutlet UIButton *saveUserButton;

- (IBAction)onContactInfoButtonPressed:(id)sender;

- (IBAction)onSendYourContactInfoButtonPressed:(id)sender;


@end
