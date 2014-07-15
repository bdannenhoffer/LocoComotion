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
    CCNode *_spawnArea1;
    CCNode *_spawnArea2;
    CCNode *_spawnArea3;
    CCSprite *_trackTile1;
    CCSprite *_trackTile2;
    CCSprite *_trackTile3;
    CCNode *_selectedTile;
    CCNode *_newTile;
    CCLabelTTF *_countdownLabel;
    
    float time;
}

- (id)init
{
    if (self = [super init])
    {
        self.userInteractionEnabled = TRUE;

        time = 15;
        _countdownLabel.string = [NSString stringWithFormat:@"%d", abs(ceil(time))];
       
    }
    return self;
}

//Loads three tiles upon opening the level
-(void)didLoadFromCCB{
    _trackTile1 = [self spawnNewTile];
    _trackTile2 = [self spawnNewTile];
    _trackTile3 = [self spawnNewTile];
    
    [_spawnArea1 addChild:_trackTile1];
    [_spawnArea2 addChild:_trackTile2];
    [_spawnArea3 addChild:_trackTile3];
    
    _trackTile1.position = ccp(32, 32);
    _trackTile2.position = ccp(32, 32);
    _trackTile3.position = ccp(32, 32);
}

-(void)update:(CCTime)delta{
    _countdownLabel.string = [NSString stringWithFormat:@"%d", abs(ceil(time))];
    time -= delta;
    
//    if (abs(time) == 0)
//    {
//        NSLog(@"Train has left");
//    }
}

#pragma mark Touch and Tile Controls

//detects where the player touches.  If touched within the bounderies of a tile, the player can drag it onto the play area
//TODO: Fix bug where tiles disappear if player only taps them
-(void) touchBegan:(UITouch *)touch withEvent:(UIEvent *)event{
    CGPoint touchLocation = [touch locationInWorld];
    
    if(CGRectContainsPoint([_spawnArea1 boundingBox], touchLocation)){
        _selectedTile = _trackTile1;
        [_spawnArea1 removeChild:_selectedTile];
        [self addChild: _selectedTile];
        _selectedTile.position = touchLocation;
        
         _trackTile1 = [self spawnNewTile];
        [_spawnArea1 addChild:_trackTile1];
         _trackTile1.position = ccp(32, 32);
    }
    
    if(CGRectContainsPoint([_spawnArea2 boundingBox], touchLocation)){
        _selectedTile = _trackTile2;
        [_spawnArea2 removeChild:_selectedTile];
        [self addChild: _selectedTile];
        _selectedTile.position = touchLocation;
        
        _trackTile2 = [self spawnNewTile];
        [_spawnArea2 addChild:_trackTile2];
        _trackTile2.position = ccp(32, 32);
        
    }
    
    if(CGRectContainsPoint([_spawnArea3 boundingBox], touchLocation)){
        _selectedTile = _trackTile3;
        [_spawnArea3 removeChild:_selectedTile];
        [self addChild: _selectedTile];
        _selectedTile.position = touchLocation;
        
        _trackTile3 = [self spawnNewTile];
        [_spawnArea3 addChild:_trackTile3];
        _trackTile3.position = ccp(32, 32);
        
    }
    
}

//updates the location of the chosen tile if it is dragged
-(void) touchMoved:(UITouch *)touch withEvent:(UIEvent *)event{
    CGPoint touchLocation = [touch locationInWorld];
    _selectedTile.positionInPoints = touchLocation;
    _selectedTile.scaleX = .5;
    _selectedTile.scaleY = .5;
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

#pragma mark Gameplay

//chooses a random number 0-6 and loads a tile based off of the number
-(id)spawnNewTile{
    int num = arc4random() % 6;
    
    switch (num)
    {
        case 0:
            _newTile = [CCBReader load:@"LocoComotion tiles/CrossTile"];
            break;
        case 1:
            _newTile = [CCBReader load:@"LocoComotion tiles/LeftToBottomTile"];
            break;
        case 2:
            _newTile = [CCBReader load:@"LocoComotion tiles/LeftToRightTile"];
            break;
        case 3:
            _newTile = [CCBReader load:@"LocoComotion tiles/RightToBottomTile"];
            break;
        case 4:
            _newTile = [CCBReader load:@"LocoComotion tiles/TopToLeftTile"];
            break;
        case 5:
            _newTile = [CCBReader load:@"LocoComotion tiles/TopToRightTile"];
            break;
        case 6:
            _newTile = [CCBReader load:@"LocoComotion tiles/UpAndDownTile"];
            break;
    }
    _newTile.position = ccp(0,0);
    return _newTile;
}

#pragma mark Navigation Buttons

-(void)pause{
    CCScene *pauseScene = [CCBReader loadAsScene:@"PauseMenu"];
    [[CCDirector sharedDirector] pushScene:pauseScene];
}

@end
