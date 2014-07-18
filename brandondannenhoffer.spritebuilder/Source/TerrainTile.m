//
//  TerrainTile.m
//  brandondannenhoffer
//
//  Created by Brandon Dannenhoffer on 7/16/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "TerrainTile.h"

@implementation TerrainTile

-(void)didLoadFromCCB{
    self.occupiable = YES;
    self.nextRouteLeft = NO;
    self.nextRouteRight = NO;
    self.nextRouteBottom = NO;
    self.nextRouteTop = NO;
}

@end
