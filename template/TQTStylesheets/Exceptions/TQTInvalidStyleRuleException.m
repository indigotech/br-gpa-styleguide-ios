//
//  TAQInvalidStyleRuleException.m
//  template
//
//  Created by Taqtile on 6/9/15.
//  Copyright (c) 2015 Taqtile. All rights reserved.
//

#import "TQTInvalidStyleRuleException.h"

@implementation TQTInvalidStyleRuleException
-(instancetype) initWithView:(UIView *)view style:(NSString *)style {
    self = [super initWithName: @"TQTInvalidStyleRuleException"
                        reason:[NSString stringWithFormat:@"\n\nEXCEPTION - INVALID STYLE RULE: \nClass: %@\nproperty:%@\nPlease, check if there is a typo on properties\n\n%@", NSStringFromClass([view class]), style, [self stackSymbols]]
                      userInfo:nil];
    return self;
}
@end
