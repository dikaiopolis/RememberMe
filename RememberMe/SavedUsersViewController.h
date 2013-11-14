//
//  SavedUsersViewController.h
//  RememberMe
//
//  Created by Daniel Baldwin on 10/24/13.
//  Copyright (c) 2013 Daniel Baldwin & Ibrahim Ayad. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import "Person.h"

@interface SavedUsersViewController : UIViewController <UICollectionViewDataSource, UICollectionViewDelegate>



@property (strong, nonatomic) NSMutableArray *savedUsersArray;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (strong, nonatomic) Person *personToPass;

@end
