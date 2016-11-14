//
//  UIView+UIViewStyle.m
//  Netshoes
//
//  Created by Taqtile on 4/23/15.
//  Copyright (c) 2015 Taqtile. All rights reserved.
//

#import "UIView+TQTViewStyle.h"
#import "TQTStylesheets.h"
#import "TQTStylesheetsProperties.h"
#import "TQTUnknownKeyException.h"

@implementation UIView (TQTViewStyle)

/**
 * This method gets called when you set a User Defined Run Time
 * attribute on your XIB which is not defined.
 *
 * To set a style, you would set a key "stylesheet" with type String
 * and value your style (ex: "H2_Label").
 *
 * @param value the view on which an attribute was set
 * @param key the undefined value
 */
-(void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    if([key isEqualToString:STYLESHEET_KEYWORD]) {
        [[TQTStylesheets sharedInstance] setStyle:value forView:self];
    } else {
        @throw [[TQTUnknownKeyException alloc] initWithKeyName:key];
    }
}

#pragma mark - Properties
-(UIColor *)borderColor {
    return [UIColor colorWithCGColor:[self.layer borderColor]];
}

-(void)setBorderColor:(UIColor *)borderColor {
    self.layer.borderColor = borderColor.CGColor;
}


@end
