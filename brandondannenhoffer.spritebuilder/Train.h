//
//  Train.h
//  brandondannenhoffer
//
//  Created by Brandon Dannenhoffer on 7/22/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "CCSprite.h"

@interface Train : CCSprite

@property (nonatomic,strong) NSMutableArray *levelArray;
@property (nonatomic, assign) float cellWidth;
@property (nonatomic, assign) float cellHeight;

-(void)moveTrain:(NSMutableArray*)level;

@end
