//
//  CaptionStylesheet.m
//  template
//
//  Created by Taqtile on 5/29/15.
//  Copyright (c) 2015 Taqtile. All rights reserved.
//

#import "TQTCaptionStylesheet.h"
#import "TQTStylesheetsProperties.h"
#import "Fonts.h"
#import "Colors.h"

@implementation TQTCaptionStylesheet
+ (NSDictionary *)stylesheet {
    return @{
             @"Caption_Label": @{
                     PK_LABEL_FONT:[UIFont fontWithName:FONT_NAME(FONT_FAMILY_PRIMARY, FONT_WEIGHT_LIGHT) size:FONT_SIZE_EXTRA_SMALL],
                     PK_LABEL_TEXT_COLOR: UICOLOR_FROM_HEX(COLOR_GRAY),
                     },
             @"Caption_IsInactive_Label": @{
                     PK_LABEL_TEXT_COLOR: UICOLOR_DISABLED_FROM_HEX(COLOR_GRAY),
                     },
             @"Caption_IsError_Label": @{
                     PK_LABEL_TEXT_COLOR: UICOLOR_FROM_HEX(COLOR_ALERT),
                     },
             };
}
@end
