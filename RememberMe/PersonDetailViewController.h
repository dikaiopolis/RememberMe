//
//  PersonDetailViewController.h
//  RememberMe
//
//  Created by Daniel Baldwin on 10/31/13.
//  Copyright (c) 2013 Daniel Baldwin & Ibrahim Ayad. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Person.h"

@interface PersonDetailViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *personNameLabel;
@property (weak, nonatomic) IBOutlet UIImageView *personImageView;
@property (weak, nonatomic) IBOutlet UITextView *notesTextView;
@property (weak, nonatomic) IBOutlet UILabel *jobTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *companyLabel;

@property (strong, nonatomic) Person *person;

- (IBAction)onBackButtonPressed:(id)sender;


@end
