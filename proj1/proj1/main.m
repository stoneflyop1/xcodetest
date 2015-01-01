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

void testNumbers();
void testShapes();
void testNSNumbers();
void testNSStrings();
void testNSArrays();

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        NSLog(@"\nTest Numbers start...");
        testNumbers();
        
        NSLog(@"\nTest Shapes start...");
        testShapes();
        
        NSLog(@"\nTest NSNumbers start...");
        testNSNumbers();
        
        NSLog(@"\nTest NSStrings start...");
        testNSStrings();
        
        NSLog(@"\nTest NSArrays start...");
        testNSArrays();
        
    }
    return 0;
}

void testNumbers() {
    Fraction *aF;
    Fraction *bF;
    Fraction *cF;
    
    NSLog(@"Fraction Count: %i", [Fraction count]);
    aF = [[Fraction allocF] init];
    NSLog(@"Fraction Count: %i", [Fraction count]);
    bF = [[Fraction allocF] init];
    NSLog(@"Fraction Count: %i", [Fraction count]);
    [aF setTo:6 over:8];
    [bF setTo:5 over:9];
    
    [aF print];
    [aF reduce];
    [aF print];
    
    cF = [aF add: bF];
    
    [cF print];
    
}

void testShapes() {
    
    Point2D *p;
    Rectangle *r;
    Square *s;
    
    p = [Point2D new];
    [p setX:10 andY:10];
    
    r = [Rectangle new];
    [r setWidth:4 height:4];
    [r setOrigin:p];
    
    [r print];
    NSLog(@"The rectangle origin is: %@", r.origin); //NSObject.description
    
    s = [Square new];
    [s setSide:5];
    [s print];
}

void testNSNumbers() {
    
    NSNumber *myNumber, *floatNumber, *intNumber;
    NSInteger myInt;
    
    intNumber = @200; //[NSNumber numberWithInt:200];
    myInt = [intNumber integerValue];
    NSLog(@"%i", (int)myInt); //Must use the cast...
    
    myNumber = [NSNumber numberWithLong:0xabcdef];
    NSLog(@"%lx", [myNumber longValue]);
    
    floatNumber = [NSNumber numberWithFloat:200.00];
    NSLog(@"%g", [floatNumber floatValue]);
    
    int compareValue = [intNumber compare:floatNumber];
    NSLog(@"%li compared %f is %i", (long)[intNumber integerValue], floatNumber.floatValue, compareValue);
    
}

void testNSStrings() {
    NSString *constString = @"Programming Is Fun"; // NSConstantString is subclass of NSString
    NSString *res, *rangeString;
    NSComparisonResult comRes;
    NSRange subRange;
    NSMutableString *muStr;
    
    res = [constString lowercaseString];
    comRes = [constString caseInsensitiveCompare:res];
    NSLog(@"Original String: %@", constString); //need to use %@ to print NSString, NSNumber etc. (NSObject)
    NSLog(@"Lowercase String: %@", res);
    NSLog(@"\"%@ \"is caseinsensitive with \"%@\": %li", constString, res, comRes);
    
    rangeString = @"Is Fun";
    subRange = [constString rangeOfString:rangeString];
    NSLog(@"range location:%lu, length:%lu of %@ from %@", (unsigned long)subRange.location, (unsigned long)subRange.length, rangeString, constString);
    
    muStr = [NSMutableString stringWithString:@"\nCamelCase String:"];
    [muStr appendString:constString];
    [muStr insertString:@"\nlowercase String:" atIndex:muStr.length];
    [muStr appendString:res];
    NSLog(@"%@", muStr);
    [muStr replaceOccurrencesOfString:@" " withString:@"" options:NSLiteralSearch range: NSMakeRange(0, muStr.length)];
    NSLog(@"Without spaces: %@", muStr);
}

void testNSArrays() {
    int i;
    NSArray *months = @[@"Jannuary", @"February", @"March", @"April",
                         @"May", @"June", @"July", @"August", @"September",
                         @"October", @"November", @"December"];
    /*
    NSArray *months = [NSArray arrayWithObjects:@"Jannuary", @"February", @"March", @"April",
                                          @"May", @"June", @"July", @"August", @"September",
                       @"October", @"November", @"December", nil];*/
    NSMutableArray *muArray;
    muArray = [NSMutableArray array];
    
    NSLog(@"Month\tName");
    for (i = 0; i < 12; i++) {
        muArray[i] = months[i];
        NSLog(@"%2i\t%@", i+1, [months objectAtIndex:i]); //months[i]
    }
    NSLog(@"Mutable Array: %@", muArray);
}
