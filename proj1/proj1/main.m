//
//  main.m
//  proj1
//
//  Created by zhangjeff on 12/27/14.
//  Copyright (c) 2014 zhangjeff. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Fraction.h"
#include "Point2D.h"
#import "Rectangle.h"
#import "Square.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Fraction *aF;
        Fraction *bF;
        Fraction *cF;
        Point2D *p;
        Rectangle *r;
        Square *s;
        
        NSLog(@"Fraction Count: %i", [Fraction count]);
        //myFraction = [[Fraction alloc] init];
        aF = [[Fraction allocF] init];
        NSLog(@"Fraction Count: %i", [Fraction count]);
        bF = [[Fraction allocF] init];
        NSLog(@"Fraction Count: %i", [Fraction count]);
        [aF setTo:6 over:8];
        [bF setTo:5 over:9];
        //myFraction.numerator = 1.0;
        //myFraction.denominator = 3.0;
        
        [aF print];
        
        [aF reduce];
        
        [aF print];
        
        cF = [aF add: bF];
        
        [cF print];
        
        p = [Point2D new];
        [p setX:10 andY:10];
        
        r = [Rectangle new];
        [r setWidth:4 height:4];
        [r setOrigin:p];
        
        [r print];
        NSLog(@"The rectangle origin is: %@", r.origin);
        
        s = [Square new];
        [s setSide:5];
        [s print];
        
        
    }
    return 0;
}
