//
//  Complex.h
//  proj1
//
//  Created by zhangjeff on 12/28/14.
//  Copyright (c) 2014 zhangjeff. All rights reserved.
//

#ifndef proj1_Complex_h
#define proj1_Complex_h

#import <Foundation/Foundation.h>

@interface Complex : NSObject

@property double real, imag;

-(void)setReal:(double)r andImag:(double) i;

-(Complex *)add:(Complex *)c;

@end


#endif
