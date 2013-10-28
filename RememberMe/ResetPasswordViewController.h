//
//  ResetPasswordViewController.h
//  RememberMe
//
//  Created by Daniel Baldwin on 10/27/13.
//  Copyright (c) 2013 Daniel Baldwin & Ibrahim Ayad. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ResetPasswordViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *emailAddressTextField;
- (IBAction)onResetButtonPressed:(id)sender;

@end
