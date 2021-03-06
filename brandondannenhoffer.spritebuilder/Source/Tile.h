//
//  Tile.h
//  brandondannenhoffer
//
//  Created by Brandon Dannenhoffer on 7/16/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "CCSprite.h"

@interface Tile : CCSprite

@property (nonatomic, assign) BOOL occupiable;
@property (nonatomic, assign) BOOL nextRouteLeft;
@property (nonatomic, assign) BOOL nextRouteRight;
@property (nonatomic, assign) BOOL nextRouteBottom;
@property (nonatomic, assign) BOOL nextRouteTop;

@end
