//
//  Fraction.h
//  proj1
//
//  Created by zhangjeff on 12/28/14.
//  Copyright (c) 2014 zhangjeff. All rights reserved.
//

#ifndef proj1_Fraction_h
#define proj1_Fraction_h

#import <Foundation/Foundation.h>

@interface Fraction : NSObject

    @property int numerator, denominator;

    -(void) print;

    -(void) setTo: (int) n over: (int) d;

    -(Fraction *) add: (Fraction *) b;

    -(void) reduce;

+(Fraction *) allocF;

+(int)count;

@end


#endif
