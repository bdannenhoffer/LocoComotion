//
//  UpAndDownTile.m
//  brandondannenhoffer
//
//  Created by Brandon Dannenhoffer on 7/18/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "UpAndDownTile.h"

@implementation UpAndDownTile

-(void)didLoadFromCCB{
    self.occupiable = NO;
    self.nextRouteLeft = NO;
    self.nextRouteRight = NO;
    self.nextRouteBottom = YES;
    self.nextRouteTop = YES;
}


@end
