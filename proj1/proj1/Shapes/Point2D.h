//
//  Point2D.h
//  proj1
//
//  Created by zhangjeff on 12/28/14.
//  Copyright (c) 2014 zhangjeff. All rights reserved.
//

#ifndef proj1_Point2D_h
#define proj1_Point2D_h

#import <Foundation/Foundation.h>

@interface Point2D : NSObject <NSCopying, NSCoding>

@property int x, y;

-(void) setX: (int) xVal andY:(int) yVal;

-(id)copyWithZone:(NSZone *)zone; //invalid exception...NSString implement this function

@end


#endif
