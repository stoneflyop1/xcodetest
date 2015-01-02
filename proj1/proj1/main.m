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
void testDictionary();
void testFileIOs();
void testDirectory();
void testURL();

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
        
        NSLog(@"\nTest NSDictionary start...");
        testDictionary();
        
        NSLog(@"\nTest File IO...");
        testFileIOs();
        
        NSLog(@"\nTest Directory...");
        testDirectory();
        
        NSLog(@"Test URL...");
        testURL();
        
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
    s.origin = p;
    [s setSide:5];
    [s print];
    NSLog(@"The square origin is: %@", s.origin); //NSObject.description
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
    for (i = 0; i < [months count]; i++) {
        muArray[i] = months[i];
        NSLog(@"%2i\t%@", i+1, [months objectAtIndex:i]); //months[i]
    }
    NSLog(@"Mutable Array: %@", muArray);
}

void testDictionary() {
    NSDictionary *states = @{@"Hebei":@"Shijiazhuang",
                                 @"Jiangsu":@"Nanjing",
                                 @"Shandong":@"Jinan"};
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    
    NSArray *keys = [states allKeys];
    keys = [keys sortedArrayUsingComparator:
            ^(id obj1, id obj2) {
                return [obj2 compare:obj1];
            }];
    for (NSString *k in keys) {
        dict[k] = states[k];
        NSLog(@"State: %@ Capital: %@", k, [states objectForKey:k]);
    }
    
    keys = [dict allKeys];
    keys = [keys sortedArrayUsingComparator:
            ^(id obj1, id obj2) {
                return [obj1 compare:obj2];
            }];
    for (NSString *k in keys) {
        NSLog(@"State: %@ Capital: %@", k, [dict objectForKey:k]);
    }
    
}

void testFileIOs() {
    NSFileManager *fileManager;
    NSData *data, *content;
    NSString *file1, *file2, *currentDir, *path;
    NSDictionary *atts;
    NSDirectoryEnumerator *dirEnumerator;
    BOOL ok;
    file1 = @"file1";
    file2 = @"file2.txt";
    
    fileManager = [NSFileManager defaultManager];
    data = [@"Test Data..." dataUsingEncoding:NSUTF8StringEncoding];
    
    NSLog(@"creating file1...");
    ok = [fileManager createFileAtPath:file1 contents:data attributes:NULL];
    if (ok == NO) {
        NSLog(@"create file failed...");
        return;
    }
    
    NSLog(@"get contents from file1...");
    content = [fileManager contentsAtPath:file1];
    NSLog(@"file1 contents: %@", content);
    NSLog(@"file1 string contents: %@", [NSString stringWithContentsOfFile:file1 encoding:NSUTF8StringEncoding error:NULL]);
    
    atts = [fileManager attributesOfItemAtPath:file1 error:NULL];
    NSLog(@"file1 attributes: %@", atts);
    
    NSLog(@"copy file1 to file2...");
    ok = [fileManager copyItemAtPath:file1 toPath:file2 error:NULL];
    if (!ok) {
        NSLog(@"copy file failed...");
    }
    
    currentDir = [fileManager currentDirectoryPath];
    dirEnumerator = [fileManager enumeratorAtPath:currentDir];
    NSLog(@"Enumerate directory...");
    while ((path=[dirEnumerator nextObject]) != nil) {
        NSLog(@"%@", path);
    }
    NSLog(@"Directory Contents...");
    for (path in [fileManager contentsOfDirectoryAtPath:currentDir error:NULL]) {
        NSLog(@"%@", path);
    }
    
    NSLog(@"remove file2...");
    ok = [fileManager removeItemAtPath:file2 error:NULL];
    if (!ok) {
        NSLog(@"remove file2 failed...");
    }
    NSLog(@"remove file1...");
    ok = [fileManager removeItemAtPath: file1 error:NULL];
    if (!ok) {
        NSLog(@"remove file1 failed...");
    }
    
}

void testDirectory() {
    
    NSArray *dirList;
    
    dirList = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    NSLog(@"Documents:\n%@", dirList);
}

void testURL() {
    NSURL *url = [NSURL URLWithString:@"http://www.163.com"];
    NSStringEncoding encoding = CFStringConvertEncodingToNSStringEncoding (kCFStringEncodingGB_18030_2000);    //GB2312,GBK
    NSError * err;
    
    NSString *content = [NSString stringWithContentsOfURL:url encoding:encoding error:&err];
    
    NSLog(@"\n%@ Contents: \n%@, Error: %@", url, content, err);
}
