//
//  RockTile.m
//  brandondannenhoffer
//
//  Created by Brandon Dannenhoffer on 7/25/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "RockTile.h"

@implementation RockTile

-(void)didLoadFromCCB{
    self.occupiable = NO;
    self.nextRouteLeft = YES;
    self.nextRouteRight = YES;
    self.nextRouteBottom = YES;
    self.nextRouteTop = YES;
}

@end
