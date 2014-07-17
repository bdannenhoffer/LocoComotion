//
//  Level.h
//  brandondannenhoffer
//
//  Created by Brandon Dannenhoffer on 7/16/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "CCScene.h"
@class Gameplay;

@interface Level : CCNode

@property (nonatomic, weak) Gameplay *gameplay;

-(void)displayLevel;

@end
