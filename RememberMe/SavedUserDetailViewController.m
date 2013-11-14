//
//  SavedUserDetailViewController.m
//  RememberMe
//
//  Created by Daniel Baldwin on 10/31/13.
//  Copyright (c) 2013 Daniel Baldwin & Ibrahim Ayad. All rights reserved.
//

#import "SavedUserDetailViewController.h"

@interface SavedUserDetailViewController ()
@end

@implementation SavedUserDetailViewController
@synthesize imageView, nameLabel, jobTitleLabel, companyLabel, textView, person;



- (void)viewDidLoad
{

NSLog(@"herename is %@", person.name);
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    nameLabel.text = person.name;
    imageView.image = person.picture;
    companyLabel.text = person.company;
    jobTitleLabel.text = person.jobTitle;
    textView.text = person.notes;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
