//
//  ImageCell.h
//  RememberMe
//
//  Created by Daniel Baldwin on 11/5/13.
//  Copyright (c) 2013 Daniel Baldwin & Ibrahim Ayad. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ImageCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *label;

@property (weak, nonatomic) IBOutlet UIButton *button;
@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *userID;
@property (strong, nonatomic) UIImage *picture;
@property (strong, nonatomic) NSString *jobTitle;
@property (strong, nonatomic) NSString *company;
@property (strong, nonatomic) NSString *notes;


@end
