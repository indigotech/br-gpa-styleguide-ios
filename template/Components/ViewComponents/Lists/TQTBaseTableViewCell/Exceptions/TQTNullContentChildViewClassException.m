//
//  TAQNullCellViewClass.m
//  template
//
//  Created by Taqtile on 6/9/15.
//  Copyright (c) 2015 Taqtile. All rights reserved.
//

#import "TQTNullContentChildViewClassException.h"

@implementation TQTNullContentChildViewClassException
-(instancetype) init {
    self = [super initWithName: @"TQTNullContentChildViewClassException"
                        reason:@"You should set the contentChildViewClass before calling this method. \n"
                      userInfo:nil];
    return self;
}
@end
