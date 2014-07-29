//
//  TopToLeftTile.m
//  brandondannenhoffer
//
//  Created by Brandon Dannenhoffer on 7/18/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "TopToLeftTile.h"

@implementation TopToLeftTile

-(void)didLoadFromCCB{
    self.occupiable = NO;
    self.nextRouteLeft = YES;
    self.nextRouteRight = NO;
    self.nextRouteBottom = NO;
    self.nextRouteTop = YES;
}


@end
