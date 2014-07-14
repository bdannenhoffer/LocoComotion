//
//  Gameplay.m
//  brandondannenhoffer
//
//  Created by Brandon Dannenhoffer on 7/9/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "Gameplay.h"
#import "Grid.h"

@implementation Gameplay{
    CCNode *_contentNode;
    Grid *_grid;
    CCSprite *_trackTile1;
    CCSprite *_trackTile2;
    CCSprite *_trackTile3;
    CCSprite *_selectedTile;
}

- (id)init
{
    if (self = [super init])
    {
        // activate touches on this scene
        self.userInteractionEnabled = TRUE;
        
    }
    return self;
}

#pragma mark Touch and Tile Controls

//detects where the player touches.  If touched within the bounderies of a tile, the player can drag it onto the play area
//TODO: Fix bug where tiles disappear if player only taps them
-(void) touchBegan:(UITouch *)touch withEvent:(UIEvent *)event{
    CGPoint touchLocation = [touch locationInWorld];
    
    if(CGRectContainsPoint([_trackTile1 boundingBox], touchLocation)){
        _selectedTile = _trackTile1;
        _selectedTile.position = touchLocation;
        
    }
    
    if(CGRectContainsPoint([_trackTile2 boundingBox], touchLocation)){
        _selectedTile = _trackTile2;
        _selectedTile.position = touchLocation;
        
    }
    
    if(CGRectContainsPoint([_trackTile3 boundingBox], touchLocation)){
        _selectedTile = _trackTile3;
        _selectedTile.position = touchLocation;
        
    }
    
}

//updates the location of the chosen tile if it is dragged
-(void) touchMoved:(UITouch *)touch withEvent:(UIEvent *)event{
    CGPoint touchLocation = [touch locationInWorld];
    _selectedTile.positionInPoints = touchLocation;
}

//snaps the selected tile to the grid and resets it once the player lets go
-(void) touchEnded:(UITouch *)touch withEvent:(UIEvent *)event{
    [self snapTileToPosition:touch];
    _selectedTile = nil;
}

//when a tile is dragged onto the play area it is snapped into position by moving the tile to the cell's location
-(void) snapTileToPosition:(UITouch *)touch{
    
    CGPoint touchLocation = [touch locationInNode:_grid];
    
    float cellPositionY = touchLocation.y / 32;
    float cellPositionX = touchLocation.x / 32;
    
    for (int i = 0; i < GRID_COLUMNS; i++)
        for (int j = 0; j < GRID_ROWS; j++){
            if (cellPositionY >= j && cellPositionY < j+1 && cellPositionX >= i && cellPositionX < i+1){
                NSValue *cell = _grid.gridArray[j][i];
                CGPoint cellPoint = [_grid convertToWorldSpace:[cell CGPointValue]];  //Converts point value from the world to the _grid node
                _selectedTile.positionInPoints = cellPoint;
            }
        }
}

#pragma mark Navigation Buttons

-(void)pause{
    CCScene *pauseScene = [CCBReader loadAsScene:@"PauseMenu"];
    [[CCDirector sharedDirector] pushScene:pauseScene];
}

@end
