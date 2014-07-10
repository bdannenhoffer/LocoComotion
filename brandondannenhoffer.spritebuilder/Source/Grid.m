//
//  Grid.m
//  brandondannenhoffer
//
//  Created by Brandon Dannenhoffer on 7/10/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "Grid.h"

@implementation Grid{
    NSMutableArray *_gridArray;
    float _cellWidth;
    float _cellHeight;
    
}
static const NSInteger GRID_COLUMNS = 14;
static const NSInteger GRID_ROWS = 10;

-(void)didLoadFromCCB{
    [self setUpGrid];
}

-(void)setUpGrid{
    //sets the width and height of the cells
    _cellWidth = self.contentSize.width / GRID_COLUMNS;
    _cellHeight = self.contentSize.height / GRID_ROWS;
    
    //creates an empty array
    _gridArray = [NSMutableArray array];
    
    float x = 0;
    float y = 0;

    for (int i = 0; i < GRID_ROWS; i++){
        //iterates through each row
        x = 0;
        for (int j = 0; j < GRID_COLUMNS; j++){
            CCNode *_backgroundCell;
            _backgroundCell.contentSize = CGSizeMake(_cellHeight, _cellWidth);
            _backgroundCell.position = ccp(x, y);
            x += _cellHeight;
        }
        y += _cellWidth;
            
    }
}

@end
