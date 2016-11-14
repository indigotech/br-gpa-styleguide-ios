//
//  TitleStylesheet.m
//  Netshoes
//
//  Created by Taqtile on 4/24/15.
//  Copyright (c) 2015 Taqtile. All rights reserved.
//

#import "TQTTitleStylesheet.h"
#import "TQTStylesheetsProperties.h"
#import "Fonts.h"
#import "Colors.h"

@implementation TQTTitleStylesheet

+ (NSDictionary *)stylesheet {
    return @{
             @"H1_Label": @{
                     PK_LABEL_FONT:[UIFont fontWithName:FONT_NAME(FONT_FAMILY_PRIMARY, FONT_WEIGHT_REGULAR) size:FONT_SIZE_EXTRA_LARGE],
                     PK_LABEL_TEXT_COLOR: UICOLOR_FROM_HEX(COLOR_WHITE),
                     },
             @"H2_Label": @{
                     PK_LABEL_FONT:[UIFont fontWithName:FONT_NAME(FONT_FAMILY_PRIMARY, FONT_WEIGHT_MEDIUM) size:FONT_SIZE_LARGE],
                     PK_LABEL_TEXT_COLOR: UICOLOR_FROM_HEX(COLOR_GRAY_DARKEST),
                     },
             @"H3_Label": @{
                     PK_LABEL_FONT:[UIFont fontWithName:FONT_NAME(FONT_FAMILY_PRIMARY, FONT_WEIGHT_REGULAR) size:FONT_SIZE_MEDIUM],
                     PK_LABEL_TEXT_COLOR: UICOLOR_FROM_HEX(COLOR_GRAY),
                     },
             @"H4_Label": @{
                     PK_LABEL_FONT:[UIFont fontWithName:FONT_NAME(FONT_FAMILY_PRIMARY, FONT_WEIGHT_REGULAR) size:FONT_SIZE_MEDIUM],
                     PK_LABEL_TEXT_COLOR: UICOLOR_FROM_HEX(COLOR_GRAY_DARKEST),
                     },
             @"H4_IsHighlighted_Label": @{
                     PK_LABEL_TEXT_COLOR: UICOLOR_HIGHLIGHTED_FROM_HEX(COLOR_GRAY_DARKEST),
                     },
             @"H4Sub_Label": @{
                     PK_LABEL_FONT:[UIFont fontWithName:FONT_NAME(FONT_FAMILY_PRIMARY, FONT_WEIGHT_LIGHT) size:FONT_SIZE_SMALL],
                     PK_LABEL_TEXT_COLOR: UICOLOR_FROM_HEX(COLOR_GRAY),
                     },
             @"H4Sub_IsHighlighted_Label": @{
                     PK_LABEL_TEXT_COLOR: UICOLOR_HIGHLIGHTED_FROM_HEX(COLOR_GRAY),
                     },
             @"H5_Label": @{
                     PK_LABEL_FONT:[UIFont fontWithName:FONT_NAME(FONT_FAMILY_PRIMARY, FONT_WEIGHT_REGULAR) size:FONT_SIZE_SMALL],
                     PK_LABEL_TEXT_COLOR: UICOLOR_FROM_HEX(COLOR_GRAY),
                     },
             };
}
@end
