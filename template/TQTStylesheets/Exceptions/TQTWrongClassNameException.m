//
//  TAQInvalidStyleruleException.m
//  template
//
//  Created by Taqtile on 6/9/15.
//  Copyright (c) 2015 Taqtile. All rights reserved.
//

#import "TQTWrongClassNameException.h"

@implementation TQTWrongClassNameException
-(instancetype) initWithClass:(Class)class {
    self = [super initWithName: @"TQTWrongClassNameException"
                        reason:[NSString stringWithFormat:@"\n\nEXCEPTION: You can't import the class %@. It should have the suffix 'Stylesheet'. Check if it is really a class that implements the method 'stylesheet' (not a UIView) \n\n%@", NSStringFromClass(class), [self stackSymbols]]
                      userInfo:nil];
    return self;
}
@end
