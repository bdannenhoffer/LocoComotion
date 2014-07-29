//
//  RightToBottomTile.m
//  brandondannenhoffer
//
//  Created by Brandon Dannenhoffer on 7/18/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "RightToBottomTile.h"

@implementation RightToBottomTile

-(void)didLoadFromCCB{
    self.occupiable = NO;
    self.nextRouteLeft = NO;
    self.nextRouteRight = YES;
    self.nextRouteBottom = YES;
    self.nextRouteTop = NO;
}


@end
