//
//  LabelStylesheet.m
//  template
//
//  Created by Taqtile on 6/1/15.
//  Copyright (c) 2015 Taqtile. All rights reserved.
//

#import "TQTLabelStylesheet.h"
#import <UIKit/UIKit.h>
#import "TQTStylesheetsProperties.h"
#import "Fonts.h"
#import "Colors.h"

@implementation TQTLabelStylesheet
+ (NSDictionary *)stylesheet {
    return @{
             @"Label_Label": @{
                     PK_LABEL_FONT:[UIFont fontWithName:FONT_NAME(FONT_FAMILY_PRIMARY, FONT_WEIGHT_REGULAR) size:FONT_SIZE_SMALL],
                     PK_LABEL_TEXT_COLOR: UICOLOR_FROM_HEX(COLOR_GRAY_DARKEST),
                    },
             @"Label_IsInactive_Label": @{
                     PK_LABEL_TEXT_COLOR: UICOLOR_DISABLED_FROM_HEX(COLOR_GRAY_DARKEST),
                    },
             @"Label_IsError_Label": @{
                     PK_LABEL_TEXT_COLOR: UICOLOR_FROM_HEX(COLOR_ALERT),
                    },
             };
}
@end
