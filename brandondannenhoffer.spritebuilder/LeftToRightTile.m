//
//  LeftToRightTile.m
//  brandondannenhoffer
//
//  Created by Brandon Dannenhoffer on 7/18/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "LeftToRightTile.h"

@implementation LeftToRightTile

-(void)didLoadFromCCB{
    self.occupiable = NO;
    self.nextRouteLeft = YES;
    self.nextRouteRight = YES;
    self.nextRouteBottom = NO;
    self.nextRouteTop = NO;
}


@end
