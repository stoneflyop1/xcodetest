//
//  Fraction.m
//  proj1
//
//  Created by zhangjeff on 12/28/14.
//  Copyright (c) 2014 zhangjeff. All rights reserved.
//
#import <Foundation/Foundation.h>
#import "Fraction.h"

static int gCounter;

@implementation Fraction

    @synthesize numerator, denominator;

    -(void) print {
        NSLog(@"%i/%i", numerator, denominator);
    }

    -(void) setTo:(int)n over:(int)d {
        denominator = d;
        numerator = n;
    }

    -(Fraction *) add:(Fraction *)b {
        int n = numerator * b.denominator + denominator * b.numerator;
        int d = denominator * b.denominator;
        Fraction * f = [[Fraction alloc] init];
        [f setTo:n over:d];
        [f reduce];
        return f;
        
    }

    -(void) reduce {
        int u = numerator;
        int v = denominator;
        int temp;
        
        while(v != 0) {
            temp = u % v;
            u = v;
            v = temp;
        }
        
        numerator /= u;
        denominator /= u;
    }

+(Fraction *) allocF {
    extern int gCounter;
    gCounter++;
    
    return [Fraction alloc];
}

+(int)count {
    extern int gCounter;
    return gCounter;
}


@end
