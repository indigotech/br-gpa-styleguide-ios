//
//  ViewStylesheet.m
//  template
//
//  Created by Taqtile on 6/3/15.
//  Copyright (c) 2015 Taqtile. All rights reserved.
//

#import "TQTViewStylesheet.h"
#import <UIKit/UIKit.h>
#import "TQTStylesheetsProperties.h"
#import "Fonts.h"
#import "Colors.h"

@implementation TQTViewStylesheet
+ (NSDictionary *)stylesheet {
    return @{
             @"Separator_TypeDarker_View": @{
                     PK_VIEW_BACKGROUND_COLOR: UICOLOR_FROM_HEX(COLOR_GRAY)
                    },
             @"Separator_View": @{
                     PK_VIEW_BACKGROUND_COLOR: UICOLOR_FROM_HEX(COLOR_GRAY_LIGHTEST)
                    },
             };
}
@end
