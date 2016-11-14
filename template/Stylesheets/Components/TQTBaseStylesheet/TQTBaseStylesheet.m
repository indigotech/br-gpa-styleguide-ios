//
//  BaseStylesheet.m
//  Netshoes
//
//  Created by Taqtile on 4/23/15.
//  Copyright (c) 2015 Taqtile. All rights reserved.
//

#import "TQTBaseStylesheet.h"
#import "TQTStylesheetsProperties.h"
#import "Fonts.h"
#import "UIImage+TQTImageWithColor.h"

@implementation TQTBaseStylesheet
+ (NSDictionary *)stylesheet {
    return @{
             @"UIButton": @{
                     PK_BUTTON_LABEL_FONT: [UIFont fontWithName:FONT_NAME(FONT_FAMILY_PRIMARY, FONT_WEIGHT_REGULAR) size:FONT_SIZE_SMALL],
                     PK_BUTTON_TYPE: [NSNumber numberWithInt:UIButtonTypeCustom],
                    },
             };
}
@end
