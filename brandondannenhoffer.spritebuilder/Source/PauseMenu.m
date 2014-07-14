//
//  PauseMenu.m
//  brandondannenhoffer
//
//  Created by Brandon Dannenhoffer on 7/11/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "PauseMenu.h"

@implementation PauseMenu

-(void)unpause{
    [[CCDirector sharedDirector] popScene];
}

-(void)quit{
    CCScene *mainScene = [CCBReader loadAsScene:@"MainScene"];
    [[CCDirector sharedDirector] replaceScene:mainScene];
}
@end
