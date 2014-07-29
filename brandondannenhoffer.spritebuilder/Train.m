//
//  Train.m
//  brandondannenhoffer
//
//  Created by Brandon Dannenhoffer on 7/22/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "Train.h"

#import "Tile.h"
#import "NoTile.h"
#import "RockTile.h"

#import "Grid.h"
#import "Level.h"


@implementation Train{
    float desiredPositionX;
    float desiredPositionY;
    float trainAngle;  //The direction the train is moving in.
    float angle;  //The angle the train needs to move in.
    NSString *direction;
    
    Tile *tileOnLeft;
    Tile *tileOnRight;
    Tile *tileOnTop;
    Tile *tileOnBottom;
    Tile *currentTile;
    
    Level *level;
    
#define EPSILON 3
}

-(void)didLoadFromCCB{
    direction = @"left";
}

-(void)update:(CCTime)delta{
    currentTile = [self findCurrentTileInLevel:level.levelArray];
    if ([currentTile isKindOfClass:[RockTile class]]){
        CCScene *pauseScene = [CCBReader loadAsScene:@"LoseScene"];
        [[CCDirector sharedDirector] pushScene:pauseScene];
    }

}

-(void)moveTrain:(NSMutableArray*)level {
    
    desiredPositionX = self.position.x;
    desiredPositionY = self.position.y;
    
    int cellPositionX = floor(self.position.x / 32);
    int cellPositionY = floor(self.position.y / 32);
    
    currentTile = [self findCurrentTileInLevel:level];
    
    //Checks to see if the surrounding tiles are in bounds and then assigns them to a variable.
    //If surrounding tiles are out of bounds then they are assigned as a null object.
    if (cellPositionX - 1 > 0)
        tileOnLeft = level[cellPositionY][cellPositionX-1];
    else
        tileOnLeft = [NoTile makeNoTile];
    if (cellPositionX + 1 < 10)
        tileOnRight = level[cellPositionY][cellPositionX+1];
    else
        tileOnRight = [NoTile makeNoTile];
    if (cellPositionY + 1 < 14)
        tileOnTop = level[cellPositionY+1][cellPositionX];
    else
        tileOnTop = [NoTile makeNoTile];
    if (cellPositionY - 1 > 0)
        tileOnBottom = level[cellPositionY-1][cellPositionX];
    else
        tileOnBottom = [NoTile makeNoTile];
    
    
    //Checks each tile surrounding the current tile to see if the route is open.
    //If the route is open then it changes the trains position.
//    if ([currentTile isKindOfClass:[RockTile class]]){
//        CCScene *pauseScene = [CCBReader loadAsScene:@"LoseScene"];
//        [[CCDirector sharedDirector] pushScene:pauseScene];
//    }
    if ([self findRouteConnectionLeft:tileOnLeft] && ![direction isEqualToString:@"left"])
    {
        desiredPositionX = self.position.x - 32;
        desiredPositionY = self.position.y;
        trainAngle = 180;
        direction = @"right";
    }
    else if ([self findRouteConnectionRight:tileOnRight] && ![direction isEqualToString:@"right"])
    {
        desiredPositionX = self.position.x + 32;
        desiredPositionY = self.position.y;
        trainAngle = 0;
        direction = @"left";
    }
    else if ([self findRouteConnectionTop:tileOnTop] && ![direction isEqualToString:@"top"])
    {
        desiredPositionX = self.position.x;
        desiredPositionY = self.position.y + 32;
        trainAngle = 90;
        direction = @"bottom";
    }
    else if ([self findRouteConnectionBottom:tileOnBottom] && ![direction isEqualToString:@"bottom"])
    {
        desiredPositionX = self.position.x;
        desiredPositionY = self.position.y - 32;
        trainAngle = 270;
        direction = @"top";
        
    }
    CCActionMoveTo *moveAction = [CCActionMoveTo actionWithDuration:1.0f position: CGPointMake(desiredPositionX, desiredPositionY)];
    CCActionCallBlock *nextMove = [CCActionCallBlock actionWithBlock:^{
        [self moveTrain:level];
    }];
    [self runAction:[CCActionSequence actions:moveAction, nextMove, nil]];
    
//    CCActionRotateBy *rotateTrain = [CCActionRotateBy actionWithDuration:1.0f angle:angle];
//    [self runAction: rotateTrain];
}

//Checks tile to left and returns if there is a route connection
-(BOOL)findRouteConnectionLeft:(Tile*)tileOnLeft{
    if (currentTile.nextRouteLeft == YES && tileOnLeft.nextRouteRight == YES)
        return YES;
    else
        return NO;
}

-(BOOL)findRouteConnectionRight:(Tile*)tileOnRight{
    if (currentTile.nextRouteRight == YES && tileOnRight.nextRouteLeft == YES)
        return YES;
    else
        return NO;
}

-(BOOL)findRouteConnectionBottom:(Tile*)tileOnBottom{
    if (currentTile.nextRouteBottom == YES && tileOnBottom.nextRouteTop == YES)
        return YES;
    else
        return NO;
}

-(BOOL)findRouteConnectionTop:(Tile*)tileOnTop{
    if (currentTile.nextRouteTop == YES && tileOnTop.nextRouteBottom == YES)
        return YES;
    else
        return NO;
}

//Finds the current tile that the train occupies
-(id)findCurrentTileInLevel:level{
    
    int cellPositionX = floor(self.position.x / 32);
    int cellPositionY = floor(self.position.y / 32);
    
    currentTile = level[cellPositionY][cellPositionX];
    
    return currentTile;
}


@end
