//
//  MainStylesheet.m
//  Netshoes
//
//  Created by Taqtile on 4/23/15.
//  Copyright (c) 2015 Taqtile. All rights reserved.
//

#import "TQTStylesheetImporter.h"
#import "TQTStylesheets.h"
#import "TQTBaseStylesheet.h"
#import "TQTTitleStylesheet.h"
#import "TQTButtonStylesheet.h"
#import "TQTFormTextualElementsStylesheet.h"
#import "TQTCaptionStylesheet.h"
#import "TQTBodyStylesheet.h"
#import "TQTCustomTextFieldViewStylesheet.h"
#import "TQTLabelStylesheet.h"
#import "TQTCustomRadioButtonViewStylesheet.h"
#import "TQTCustomCheckboxButtonViewStylesheet.h"
#import "TQTViewStylesheet.h"


@implementation TQTStylesheetImporter
+ (void)setupTQTStylesheet {
    TQTStylesheets *sharedInstance = [TQTStylesheets sharedInstance];
    [sharedInstance import:[TQTBaseStylesheet stylesheet]];
    [sharedInstance import:[TQTTitleStylesheet stylesheet]];
    [sharedInstance import:[TQTButtonStylesheet stylesheet]];
    [sharedInstance import:[TQTLabelStylesheet stylesheet]];
    [sharedInstance import:[TQTFormTextualElementsStylesheet stylesheet]];
    [sharedInstance import:[TQTCaptionStylesheet stylesheet]];
    [sharedInstance import:[TQTBodyStylesheet stylesheet]];
    [sharedInstance import:[TQTCustomTextFieldViewStylesheet stylesheet]];
    [sharedInstance import:[TQTCustomRadioButtonViewStylesheet stylesheet]];
    [sharedInstance import:[TQTCustomCheckboxButtonViewStylesheet stylesheet]];
    [sharedInstance import:[TQTViewStylesheet stylesheet]];
}
@end
