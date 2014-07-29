//
//  Grid.m
//  brandondannenhoffer
//
//  Created by Brandon Dannenhoffer on 7/10/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "Grid.h"

const NSInteger GRID_COLUMNS = 14;
const NSInteger GRID_ROWS = 10;

@implementation Grid{
}



-(void)didLoadFromCCB{
    self.gridArray = [NSMutableArray array];
    [self setUpGrid];
}

-(void) setUpGrid{
    //sets the width and height of the cells
    _cellWidth = self.contentSize.width / GRID_COLUMNS;
    _cellHeight = self.contentSize.height / GRID_ROWS;
    
    
    float x = 0;
    float y = 0;

    for (int i = 0; i < GRID_ROWS; i++){
        //iterates through each row
        x = 0;
        self.gridArray[i] = [NSMutableArray array];
        for (int j = 0; j < GRID_COLUMNS; j++){
            self.gridArray[i][j] = [NSValue valueWithCGPoint:ccp(x+16, y+16)];
            x += _cellHeight;
        }
        y += _cellWidth;
            
    }
}

@end
