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

#import "Tile.h"
#import "CrossTile.h"
#import "UpAndDownTile.h"
#import "LeftToBottomTile.h"
#import "LeftToRightTile.h"
#import "RightToBottomTile.h"
#import "TopToLeftTile.h"
#import "TopToRightTile.h"
#import "TerrainTile.h"
#import "RockTile.h"

@implementation Level{
    TerrainTile *_levelTiles;
    LeftToRightTile *startTile;
    RockTile *_rockTile;
#define startingX 0
#define startingY 2

#define rockX 5
#define rockY 7
}

-(void)didLoadFromCCB{
    self.levelArray = [NSMutableArray array];
    [self createLevel];
}

-(void)createLevel{
    for (int i = 0; i < GRID_ROWS; i++){
        self.levelArray[i] = [NSMutableArray array];
        for (int j = 0; j < GRID_COLUMNS; j++){
            if (i!= startingY || j!=startingX){
                if (i == rockX && j == rockY){
                    _rockTile = (Tile*)[CCBReader load:@"LocoComotion tiles/RockTile"];
                    self.levelArray[i][j] = _rockTile;
                }
                else{
                    _levelTiles = (TerrainTile*)[CCBReader load:@"LocoComotion tiles/EmptyTerrain"];
                    self.levelArray[i][j] = _levelTiles;
                }
            }
            else {
                startTile = (Tile*)[CCBReader load:@"LocoComotion tiles/LeftToRightTile"];
                self.levelArray[i][j] = startTile;
            }
        }
    }
}

-(void)displayLevel{

    for (int i = 0; i < GRID_ROWS; i++){
        for (int j = 0; j < GRID_COLUMNS; j++){
            NSValue *cell = self.gameplay.grid.gridArray[i][j];
            CGPoint cellPosition = [cell CGPointValue];
            _levelTiles = self.levelArray[i][j];
            _levelTiles.scaleX = .5;
            _levelTiles.scaleY = .5;
            [self addChild:_levelTiles];
            _levelTiles.positionInPoints = cellPosition;
        }
    }
//    [self addChild:startTile];
//    [[self.levelArray objectAtIndex:2]replaceObjectAtIndex:0 withObject:startTile];

}

-(Tile*)findTileInCell:(UITouch*)touch{
    CGPoint touchLocation = [touch locationInNode: self.gameplay.grid];
    
    int cellPointX = abs(touchLocation.x / 32);
    int cellPointY = abs(touchLocation.y / 32);
    
    return self.levelArray[cellPointY][cellPointX];
}
  
@end
