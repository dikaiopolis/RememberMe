//
//  NewAccountViewController.h
//  RememberMe
//
//  Created by Ibrahim Ayad on 10/22/13.
//  Copyright (c) 2013 Daniel Baldwin & Ibrahim Ayad. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewAccountViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *fullName;
@property (weak, nonatomic) IBOutlet UITextField *userName;

@property (weak, nonatomic) IBOutlet UITextField *passWord;

@property (weak, nonatomic) IBOutlet UITextField *email;

@property (weak, nonatomic) IBOutlet UITextField *company;


- (IBAction)pushToParse:(id)sender;


@end

