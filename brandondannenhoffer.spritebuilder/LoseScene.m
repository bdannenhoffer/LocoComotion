//
//  LoseScene.m
//  brandondannenhoffer
//
//  Created by Brandon Dannenhoffer on 7/25/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "LoseScene.h"

@implementation LoseScene

//Exits to main scene
-(void)quit{
    CCScene *mainScene = [CCBReader loadAsScene:@"MainScene"];
    [[CCDirector sharedDirector] replaceScene:mainScene];
}

//restarts current level
-(void)restart{
    CCScene *mainScene = [CCBReader loadAsScene:@"Gameplay"];
    [[CCDirector sharedDirector] replaceScene:mainScene];
}

@end
