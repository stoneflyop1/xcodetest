//
//  Rectangle.m
//  proj1
//
//  Created by zhangjeff on 12/28/14.
//  Copyright (c) 2014 zhangjeff. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Point2D.h"
#import "Rectangle.h"

@implementation Rectangle {
    Point2D *origin;
}

@synthesize width, height, origin;

-(void) setWidth:(int)w height:(int)h{
    width= w;
    height = h;
    
}

-(void)setOrigin:(Point2D *)o {
    if (!origin) {
        origin = [Point2D new];
    }
    [origin setX:o.x andY:o.y];
}

-(int)area{
    return width * height;
}

-(int)perimeter{
    return 2*(width+height);
}

-(void)print {
    NSLog(@"Width: %i, Height: %i", width, height);
}

@end
