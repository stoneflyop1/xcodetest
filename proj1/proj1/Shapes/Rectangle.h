//
//  Rectangle.h
//  proj1
//
//  Created by zhangjeff on 12/28/14.
//  Copyright (c) 2014 zhangjeff. All rights reserved.
//

#ifndef proj1_Rectangle_h
#define proj1_Rectangle_h

#import <Foundation/Foundation.h>

@class Point2D;

@interface Rectangle : NSObject

@property int width, height;
@property (copy, nonatomic) Point2D* origin;

-(void)setOrigin:(Point2D *)o;
-(int) area;
-(int) perimeter;

-(void) setWidth:(int) w height: (int)h;

-(void)print;

@end

#endif
