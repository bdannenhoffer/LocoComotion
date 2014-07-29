//
//  NoTile.m
//  brandondannenhoffer
//
//  Created by Brandon Dannenhoffer on 7/24/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "NoTile.h"

@implementation NoTile

+(NoTile*)makeNoTile{
    NoTile *tileless;
    tileless.occupiable = NO;
    tileless.nextRouteLeft = NO;
    tileless.nextRouteRight = NO;
    tileless.nextRouteBottom = NO;
    tileless.nextRouteTop = NO;
    
    return  tileless;
}

@end
