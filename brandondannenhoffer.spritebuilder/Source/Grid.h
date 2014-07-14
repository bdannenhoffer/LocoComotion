//
//  Grid.h
//  brandondannenhoffer
//
//  Created by Brandon Dannenhoffer on 7/10/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "CCNode.h"

@interface Grid : CCNode

extern const NSInteger GRID_COLUMNS;
extern const NSInteger GRID_ROWS;
@property (nonatomic, strong) NSMutableArray *gridArray;


@end
