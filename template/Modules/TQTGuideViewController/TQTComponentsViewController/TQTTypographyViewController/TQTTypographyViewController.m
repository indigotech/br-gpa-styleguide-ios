//
//  TypographyViewController.m
//  template
//
//  Created by Taqtile on 5/28/15.
//  Copyright (c) 2015 Taqtile. All rights reserved.
//

#import "TQTTypographyViewController.h"
#import "Fonts.h"
#import "TQTStylesheets.h"
#import "TQTGuideTitleView.h"
#import "TQTGuideSubtitleView.h"

@interface TQTTypographyViewController ()

@end

@implementation TQTTypographyViewController
#pragma mark - VC lifecycle
-(void)viewDidLoad {
    [super viewDidLoad];
    [self setTitle:@"Typography"];
}

#pragma mark - overriden method
- (void)addComponents {
    [self addGeneralRules];
    [self addTextualElementsInForms];
}

#pragma mark - private
- (void)addGeneralRules {
    [self addGuideTitleWithText:@"1.1 GENERAL RULES"];
    
    [self addFontFamily];
    [self addFontSizes];
    [self addFontWeights];
}

- (void)addFontFamily {
    [self addGuideSubtitleWithText:@"1.1.1 FONT FAMILY"];
    
    [self addLabelWithText:[NSString stringWithFormat:@"Primary font - %@", FONT_FAMILY_PRIMARY]
                      font:[UIFont fontWithName:FONT_NAME(FONT_FAMILY_PRIMARY, FONT_WEIGHT_REGULAR) size:FONT_SIZE_MEDIUM]];
    [self addLabelWithText:[NSString stringWithFormat:@"Secondary font - %@", FONT_FAMILY_PRIMARY]
                      font:[UIFont fontWithName:FONT_NAME(FONT_FAMILY_SECONDARY, FONT_WEIGHT_REGULAR) size:FONT_SIZE_MEDIUM]];
}

- (void)addFontSizes {
    [self addGuideSubtitleWithText:@"1.1.2 SIZES"];
    
    [self addLabelWithText:[NSString stringWithFormat:@"EXTRA LARGE (XL): %d", FONT_SIZE_EXTRA_LARGE]
                      font:[UIFont fontWithName:FONT_NAME(FONT_FAMILY_PRIMARY, FONT_WEIGHT_REGULAR) size:FONT_SIZE_MEDIUM]];
    [self addLabelWithText:[NSString stringWithFormat:@"LARGE (XL): %d", FONT_SIZE_LARGE]
                      font:[UIFont fontWithName:FONT_NAME(FONT_FAMILY_PRIMARY, FONT_WEIGHT_REGULAR) size:FONT_SIZE_LARGE]];
    [self addLabelWithText:[NSString stringWithFormat:@"MEDIUM (M): %d", FONT_SIZE_MEDIUM]
                      font:[UIFont fontWithName:FONT_NAME(FONT_FAMILY_PRIMARY, FONT_WEIGHT_REGULAR) size:FONT_SIZE_MEDIUM]];
    [self addLabelWithText:[NSString stringWithFormat:@"SMALL (S): %d", FONT_SIZE_SMALL]
                      font:[UIFont fontWithName:FONT_NAME(FONT_FAMILY_PRIMARY, FONT_WEIGHT_REGULAR) size:FONT_SIZE_SMALL]];
    [self addLabelWithText:[NSString stringWithFormat:@"EXTRA SMALL (XS): %d", FONT_SIZE_EXTRA_SMALL]
                      font:[UIFont fontWithName:FONT_NAME(FONT_FAMILY_PRIMARY, FONT_WEIGHT_REGULAR) size:FONT_SIZE_EXTRA_SMALL]];
}

- (void)addFontWeights {
    [self addGuideSubtitleWithText:@"1.1.3 WEIGHT"];
    
    [self addLabelWithText:FONT_WEIGHT_BOLD
                      font:[UIFont fontWithName:FONT_NAME(FONT_FAMILY_PRIMARY, FONT_WEIGHT_BOLD) size:FONT_SIZE_MEDIUM]];
    [self addLabelWithText:@"-Regular"
                      font:[UIFont fontWithName:FONT_NAME(FONT_FAMILY_PRIMARY, FONT_WEIGHT_REGULAR) size:FONT_SIZE_MEDIUM]];
    [self addLabelWithText:FONT_WEIGHT_LIGHT
                      font:[UIFont fontWithName:FONT_NAME(FONT_FAMILY_PRIMARY, FONT_WEIGHT_LIGHT) size:FONT_SIZE_MEDIUM]];
}

- (void)addTextualElementsInForms {
    [self addGuideTitleWithText:@"1.2 TEXTUAL ELEMENTS IN FORMS"];
    
    [self addLabels];
    [self addTitles];
    [self addCaption];
    [self addBody];
}

- (void)addLabels {
    [self addGuideSubtitleWithText:@"1.2.1 LABELS"];
    [self addLabelWithText:@"Label - This is a label" style:@"Label_Label"];
}

- (void)addTitles {
    [self addGuideTitleWithText:@"1.3 TITLES"];
    
    [self addLabelWithText:@"H1 - Heading 1" style:@"H1_Label"];
    [self addLabelWithText:@"H2 - Heading 2" style:@"H2_Label"];
    [self addLabelWithText:@"H3 - Heading 3" style:@"H3_Label"];
    [self addLabelWithText:@"H4 - Heading 4" style:@"H4_Label"];
    [self addLabelWithText:@"H4 SUB - Subheading 4" style:@"H4Sub_Label"];
    [self addLabelWithText:@"H5 - Heading 5" style:@"H5_Label"];
}

- (void)addCaption {
    [self addGuideTitleWithText:@"1.4 CAPTION"];
    [self addLabelWithText:@"Caption - This is a caption." style:@"Caption_Label"];
}

- (void)addBody {
    [self addGuideTitleWithText:@"1.5 BODY"];
    [self addLabelWithText:@"Body - This is a body text." style:@"Body_Label"];
}

#pragma mark  Auxiliar private methods

-(void)addLabelWithText:(NSString *)text font:(UIFont *)font {
    UILabel *label = (UILabel *)[self addViewWithDefaultMarginsAndClass:[UILabel class] height:0];
    [label setText:text];
    [label setFont:font];
}

-(void)addLabelWithText:(NSString *)text style:(NSString *)style {
    UILabel *label = (UILabel *)[self addViewWithDefaultMarginsAndClass:[UILabel class] height:0];
    [label setText:text];
    [[TQTStylesheets sharedInstance] setStyle:style forView:label];
}
@end
