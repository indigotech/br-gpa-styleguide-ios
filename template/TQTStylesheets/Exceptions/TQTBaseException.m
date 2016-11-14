//
//  TAQBaseException.m
//  template
//
//  Created by Taqtile on 6/9/15.
//  Copyright (c) 2015 Taqtile. All rights reserved.
//

#import "TQTBaseException.h"

#define EXCEPTION_CALL_INDEX 2

@implementation TQTBaseException
-(NSArray *)stackSymbols {
    NSArray * const stackSymbols = [NSThread callStackSymbols];
    NSRange const subarrayRange = NSMakeRange(EXCEPTION_CALL_INDEX, [stackSymbols count] - EXCEPTION_CALL_INDEX);
    return [[NSThread callStackSymbols] subarrayWithRange:subarrayRange];
}
@end
