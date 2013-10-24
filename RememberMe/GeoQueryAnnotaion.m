//
//  GeoQueryAnnotaion.m
//  RememberMe
//
//  Created by Ibrahim Ayad on 10/24/13.
//  Copyright (c) 2013 Daniel Baldwin & Ibrahim Ayad. All rights reserved.
//

#import "GeoQueryAnnotaion.h"

@implementation GeoQueryAnnotaion

@synthesize title,subtitle,radius,coordinate;

- (id)initWithCoordinate:(CLLocationCoordinate2D)aCoordinate radius:(CLLocationDistance)aRadius {
    self = [super init];
    if (self) {
        coordinate = aCoordinate;
        radius = aRadius;
        
        [self configureLabels];
    }
    return self;
}
- (void)setCoordinate:(CLLocationCoordinate2D)newCoordinate {
    coordinate = newCoordinate;
    [self configureLabels];
}

- (void)configureLabels {
    NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
    [numberFormatter setNumberStyle:NSNumberFormatterDecimalStyle];
    
    title = @"Geo Query";
    
    subtitle = [NSString stringWithFormat:@"Center: (%@, %@) Radius: %@ m",
                 [numberFormatter stringFromNumber:[NSNumber numberWithFloat:coordinate.latitude]],
                 [numberFormatter stringFromNumber:[NSNumber numberWithFloat:coordinate.longitude]],
                 [numberFormatter stringFromNumber:[NSNumber numberWithInt:radius]]
                 ];
}

@end
