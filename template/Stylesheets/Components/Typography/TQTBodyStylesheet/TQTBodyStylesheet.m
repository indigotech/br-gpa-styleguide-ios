//
//  BodyStylesheet.m
//  template
//
//  Created by Taqtile on 5/29/15.
//  Copyright (c) 2015 Taqtile. All rights reserved.
//

#import "TQTBodyStylesheet.h"
#import "TQTStylesheetsProperties.h"
#import "Fonts.h"
#import "Colors.h"

@implementation TQTBodyStylesheet
+ (NSDictionary *)stylesheet {
    return @{
             @"Body_Label": @{
                     PK_LABEL_FONT:[UIFont fontWithName:FONT_NAME(FONT_FAMILY_PRIMARY, FONT_WEIGHT_REGULAR) size:FONT_SIZE_SMALL],
                     PK_LABEL_TEXT_COLOR: UICOLOR_FROM_HEX(COLOR_GRAY_LIGHTER),
                     },
             };
}
@end
