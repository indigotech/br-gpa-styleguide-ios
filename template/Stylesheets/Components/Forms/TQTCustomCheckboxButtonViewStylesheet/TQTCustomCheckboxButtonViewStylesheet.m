//
//  CustomCheckboxButtonViewStylesheet.m
//  template
//
//  Created by Taqtile on 6/2/15.
//  Copyright (c) 2015 Taqtile. All rights reserved.
//

#import "TQTCustomCheckboxButtonViewStylesheet.h"
#import <UIKit/UIKit.h>
#import "TQTStylesheetsProperties.h"
#import "Fonts.h"
#import "Colors.h"

@implementation TQTCustomCheckboxButtonViewStylesheet
+ (NSDictionary *)stylesheet {
    return @{
             @"CustomCheckboxButtonView_Button": @{
                     PK_BUTTON_CONTENT_HORIZONTAL_ALIGNMENT:[NSNumber numberWithInt:UIControlContentHorizontalAlignmentLeft],
                     PK_BUTTON_TITLE_EDGE_INSETS:[NSValue valueWithUIEdgeInsets:UIEdgeInsetsMake(0, 10, 0, 0)],
                     
                     PK_BUTTON_TINT_COLOR:UICOLOR_FROM_HEX(COLOR_GRAY_DARKEST),
                     PK_BUTTON_NORMAL_TITLE_COLOR: UICOLOR_FROM_HEX(COLOR_GRAY_DARKEST),
                     PK_BUTTON_HIGHLIGHTED_TITLE_COLOR:UICOLOR_HIGHLIGHTED_FROM_HEX(COLOR_PRIMARY),
                     PK_BUTTON_DISABLED_TITLE_COLOR:UICOLOR_DISABLED_FROM_HEX(COLOR_GRAY_DARKEST),
                    },
             };
}
@end
