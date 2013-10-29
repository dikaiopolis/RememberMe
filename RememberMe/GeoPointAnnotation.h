//
//  GeoPointAnnotation.h
//  RememberMe
//
//  Created by Ibrahim Ayad on 10/24/13.
//  Copyright (c) 2013 Daniel Baldwin & Ibrahim Ayad. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <Parse/Parse.h>

@interface GeoPointAnnotation : MKAnnotationView

@property (nonatomic, readonly) CLLocationCoordinate2D coordinate;
@property (nonatomic, readonly,copy) NSString *title;
@property (nonatomic, readonly,copy) NSString *subTitle;



@end
