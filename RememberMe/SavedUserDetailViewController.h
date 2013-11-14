//
//  SavedUserDetailViewController.h
//  RememberMe
//
//  Created by Daniel Baldwin on 10/31/13.
//  Copyright (c) 2013 Daniel Baldwin & Ibrahim Ayad. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Person.h"


@interface SavedUserDetailViewController : UIViewController

@property (strong, nonatomic) Person *person;

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *jobTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *companyLabel;
@property (weak, nonatomic) IBOutlet UITextView *textView;

@end
