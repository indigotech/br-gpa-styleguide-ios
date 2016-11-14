//
//  TableViewItemCellContentViewStylesheet.m
//  template
//
//  Created by Taqtile on 6/3/15.
//  Copyright (c) 2015 Taqtile. All rights reserved.
//

#import "SampleListItemContentChildViewStylesheet.h"
#import <UIKit/UIKit.h>
#import "TQTStylesheetsProperties.h"
#import "Fonts.h"
#import "Colors.h"

@implementation SampleListItemContentChildViewStylesheet
+ (NSDictionary *)stylesheet {
    return @{
             @"TableViewItemCellContentView_AccessoryLabel_Label": @{
                     PK_LABEL_FONT:[UIFont fontWithName:FONT_NAME(FONT_FAMILY_PRIMARY, FONT_WEIGHT_LIGHT) size:FONT_SIZE_EXTRA_SMALL],
                     PK_LABEL_TEXT_COLOR: UICOLOR_FROM_HEX(COLOR_GRAY),
                    },
             @"TableViewItemCellContentView_AccessoryLabel_IsHighlighted_Label": @{
                     PK_LABEL_TEXT_COLOR: UICOLOR_HIGHLIGHTED_FROM_HEX(COLOR_GRAY),
                    },
             };
}
@end
