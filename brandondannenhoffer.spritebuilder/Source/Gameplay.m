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
    CCNode *_grid;
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

//detects where the player touches.  If touched within the bounderies of a tile, the player can drag it onto the play area
//TODO: Fix bug where tiles disappear if player only taps them
-(void) touchBegan:(UITouch *)touch withEvent:(UIEvent *)event{
    CGPoint touchLocation = [touch locationInNode:_contentNode];
    
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
    CGPoint touchLocation = [touch locationInNode:_contentNode];
    _selectedTile.positionInPoints = touchLocation;
}

//resets the selected tile once the player lets go
-(void) touchEnded:(UITouch *)touch withEvent:(UIEvent *)event{
    _selectedTile = nil;
}

//when a tile is dragged onto the play area it is snapped into position by replacing it with an empty cell in the grid
-(void) snapTileToPosition:(UITouch *)touch{
    CGPoint touchLocation = [touch locationInNode:_grid];
    float cellPositionY = touchLocation.y / 32;
    float cellPositionX = touchLocation.x / 32;
    
}

@end
