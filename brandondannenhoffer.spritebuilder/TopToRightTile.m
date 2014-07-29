//
//  TopToRightTile.m
//  brandondannenhoffer
//
//  Created by Brandon Dannenhoffer on 7/18/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "TopToRightTile.h"

@implementation TopToRightTile

-(void)didLoadFromCCB{
    self.occupiable = NO;
    self.nextRouteLeft = NO;
    self.nextRouteRight = YES;
    self.nextRouteBottom = NO;
    self.nextRouteTop = YES;
}


@end
