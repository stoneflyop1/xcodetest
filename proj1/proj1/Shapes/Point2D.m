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
-(id)copyWithZone:(NSZone *)zone {
    Point2D *copy = [[Point2D allocWithZone:zone] init];
    [copy setX: self.x andY:self.y];
    return copy;
}

-(NSString*)description {
    return [NSString stringWithFormat: @"X=%i, Y=%i", x, y];
}

-(void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeInt:x forKey: @"x"];
    [aCoder encodeInt:y forKey:@"y"];
}

-(id)initWithCoder:(NSCoder *)aDecoder {
    x = [aDecoder decodeIntForKey:@"x"];
    y = [aDecoder decodeIntForKey:@"y"];
    return self;
}

@end
