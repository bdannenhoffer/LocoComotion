//
//  LevelSelectionScene.m
//  brandondannenhoffer
//
//  Created by Brandon Dannenhoffer on 7/9/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "LevelSelectionScene.h"

@implementation LevelSelectionScene

-(void)levelOne{
    CCScene *gameplayScene = [CCBReader loadAsScene:@"Gameplay"];
    [[CCDirector sharedDirector] replaceScene:gameplayScene];

}

-(void)back{
    CCScene *mainScene = [CCBReader loadAsScene:@"MainScene"];
    [[CCDirector sharedDirector] replaceScene:mainScene];
}

@end
