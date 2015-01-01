//
//  Complex.m
//  proj1
//
//  Created by zhangjeff on 12/28/14.
//  Copyright (c) 2014 zhangjeff. All rights reserved.
//

#import "Complex.h"

@implementation Complex

@synthesize real, imag;

-(void)setReal:(double)r andImag:(double)i {
    real = r;
    imag = i;
}

-(Complex *)add:(Complex *)c {
    Complex * c0 = [Complex new];
    double r0, i0;
    r0 = real+c.real;
    i0 = imag+c.imag;
    [c0 setReal:r0 andImag:i0];
    return c0;
}

@end
