//
//  TAQMissingMethodImplementationException.m
//  template
//
//  Created by Taqtile on 6/9/15.
//  Copyright (c) 2015 Taqtile. All rights reserved.
//

#import "TQTMissingMethodImplementationException.h"

@implementation TQTMissingMethodImplementationException
-(instancetype) initWithSelector:(SEL)selector {
    self = [super initWithName: @"TQTMissingMethodImplementationException"
                        reason:[NSString stringWithFormat:@"You must override the method %@ in a subclass \n", NSStringFromSelector(selector)]
                      userInfo:nil];
    return self;
}
@end
