//
//  LeftToBottomTile.m
//  brandondannenhoffer
//
//  Created by Brandon Dannenhoffer on 7/18/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "LeftToBottomTile.h"

@implementation LeftToBottomTile

-(void)didLoadFromCCB{
    self.occupiable = NO;
    self.nextRouteLeft = YES;
    self.nextRouteRight = NO;
    self.nextRouteBottom = YES;
    self.nextRouteTop = NO;
}


@end
