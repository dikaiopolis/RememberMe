//
//  SearchGeoViewController.h
//  RememberMe
//
//  Created by Ibrahim Ayad on 10/24/13.
//  Copyright (c) 2013 Daniel Baldwin & Ibrahim Ayad. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface SearchGeoViewController : UIViewController<MKMapViewDelegate>




- (void)setInitialLocation:(CLLocation *)aLocation;

@end
