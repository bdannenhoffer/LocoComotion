//
//  Level.m
//  brandondannenhoffer
//
//  Created by Brandon Dannenhoffer on 7/16/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "Level.h"
#import "Grid.h"
#import "Gameplay.h"
#import "TerrainTile.h"

@implementation Level{
    TerrainTile *_terrainTile;
    NSMutableArray *levelArray;
}

-(void)didLoadFromCCB{
    levelArray = [NSMutableArray array];
    [self createLevel];
//    [self displayLevel];
}

-(void)createLevel{
    for (int i = 0; i < GRID_ROWS; i++){
        levelArray[i] = [NSMutableArray array];
        for (int j = 0; j < GRID_COLUMNS; j++){
            _terrainTile = [CCBReader load:@"LocoComotion tiles/EmptyTerrain"];
            levelArray[i][j] = _terrainTile;
        }
    }
}

-(void)displayLevel{
    for (int i = 0; i < GRID_ROWS; i++){
        for (int j = 0; j < GRID_COLUMNS; j++){
            NSValue *cell = self.gameplay.grid.gridArray[i][j];
            CGPoint cellPosition = [cell CGPointValue];
            _terrainTile = levelArray[i][j];
            [self addChild:_terrainTile];
            _terrainTile.positionInPoints = cellPosition;
            
            
        }
    }
}

//-(NSObject)
  
@end
