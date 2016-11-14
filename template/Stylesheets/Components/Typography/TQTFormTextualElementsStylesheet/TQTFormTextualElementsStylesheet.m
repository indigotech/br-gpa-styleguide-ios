//
//  FormTextualElementsStylesheet.m
//  template
//
//  Created by Taqtile on 5/29/15.
//  Copyright (c) 2015 Taqtile. All rights reserved.
//

#import "TQTFormTextualElementsStylesheet.h"
#import "TQTStylesheetsProperties.h"
#import "Fonts.h"
#import "Colors.h"

@implementation TQTFormTextualElementsStylesheet
+ (NSDictionary *)stylesheet {
    return @{
             @"InputValue_TextField": @{
                     PK_TEXTFIELD_FONT:[UIFont fontWithName:FONT_NAME(FONT_FAMILY_PRIMARY, FONT_WEIGHT_REGULAR) size:FONT_SIZE_MEDIUM],
                     PK_TEXTFIELD_TINT_COLOR: UICOLOR_FROM_HEX(COLOR_GRAY_DARKEST),
                     PK_TEXTFIELD_TEXT_COLOR: UICOLOR_FROM_HEX(COLOR_GRAY_DARKEST),
                     },
             @"InputValue_IsError_TextField": @{
                     PK_TEXTFIELD_TINT_COLOR: UICOLOR_FROM_HEX(COLOR_ALERT),
                     PK_TEXTFIELD_TEXT_COLOR: UICOLOR_FROM_HEX(COLOR_ALERT),
                     },
             @"InputValue_IsInactive_TextField": @{
                     PK_TEXTFIELD_TINT_COLOR: UICOLOR_DISABLED_FROM_HEX(COLOR_GRAY_DARKEST),
                     PK_TEXTFIELD_TEXT_COLOR: UICOLOR_DISABLED_FROM_HEX(COLOR_GRAY_DARKEST)
                     },
             };
}

+ (NSDictionary *)attributedStringAttributes {
    return @{
             @"InputPlaceholder": @{
                     NSFontAttributeName:[UIFont fontWithName:FONT_NAME(FONT_FAMILY_PRIMARY, FONT_WEIGHT_LIGHT) size:FONT_SIZE_SMALL],
                     NSForegroundColorAttributeName: UICOLOR_FROM_HEX(COLOR_GRAY_LIGHTEST),
                     },
             };
    
}
@end
