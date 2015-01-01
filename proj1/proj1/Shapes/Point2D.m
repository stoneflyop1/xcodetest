//
//  Point2D.m
//  proj1
//
//  Created by zhangjeff on 12/28/14.
//  Copyright (c) 2014 zhangjeff. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Point2D.h"

@implementation Point2D

@synthesize x,y;

-(void)setX:(int)xVal andY:(int)yVal {
    
    x = xVal;
    y = yVal;
}

-(NSString*)description {
    return [NSString stringWithFormat: @"X=%i, Y=%i", x, y];
}

@end