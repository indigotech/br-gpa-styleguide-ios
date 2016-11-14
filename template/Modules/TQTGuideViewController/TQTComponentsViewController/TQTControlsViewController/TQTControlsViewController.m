//
//  TAQControlsViewController.m
//  template
//
//  Created by Taqtile on 5/29/15.
//  Copyright (c) 2015 Taqtile. All rights reserved.
//

#import "TQTControlsViewController.h"
#import "Fonts.h"
#import "Components.h"
#import "TQTStylesheets.h"

@interface TQTControlsViewController ()

@end

@implementation TQTControlsViewController

#pragma mark - VC lifecycle
-(void)viewDidLoad {
    [super viewDidLoad];
    [self setTitle:@"Controls"];
}

#pragma mark - overriden method
- (void)addComponents {
    [self addActiveButtons];
    [self addDisabledButtons];
}

- (void)addActiveButtons {
    [self addGuideTitleWithText:@"Buttons"];
    
    [self addButtonWithText:@"Primary" style:@"Primary_Button" setup:nil];
    [self addButtonWithText:@"Alert" style:@"Alert_Button" setup:nil];
    [self addButtonWithText:@"Call to Action" style:@"CallToAction_Button" setup:nil];
    [self addButtonWithText:@"Neutral" style:@"Neutral_Button" setup:nil];
    [self addButtonWithText:@"Alert outlined" style:@"AlertOutlined_Button" setup:nil];
    [self addButtonWithText:@"Link" style:@"Link_Button" setup:nil];
}

- (void)addDisabledButtons {
    [self addGuideTitleWithText:@"Disabled Buttons"];
    
    [self addButtonWithText:@"Primary" style:@"Primary_Button" setup:^(UIButton *button){ [button setEnabled:NO];}];
    [self addButtonWithText:@"Alert" style:@"Alert_Button" setup:^(UIButton *button){ [button setEnabled:NO];}];
    [self addButtonWithText:@"Call to Action" style:@"CallToAction_Button" setup:^(UIButton *button){ [button setEnabled:NO];}];
    [self addButtonWithText:@"Neutral" style:@"Neutral_Button" setup:^(UIButton *button){ [button setEnabled:NO];}];
    [self addButtonWithText:@"Alert outlined" style:@"AlertOutlined_Button" setup:^(UIButton *button){ [button setEnabled:NO];}];
    [self addButtonWithText:@"Link" style:@"Link_Button" setup:^(UIButton *button){ [button setEnabled:NO];}];
}

#pragma mark - aux methods
-(void)addButtonWithText:(NSString *)text style:(NSString *)style setup:(void (^)(UIButton *button))setup {
    UIButton *button = (UIButton *)[self addViewWithDefaultMarginsAndClass:[UIButton class] height:34];
    [[TQTStylesheets sharedInstance] setStyle:style forView:button];
    [button setTitle:text forState:UIControlStateNormal];
    
    if (setup) {
        setup(button);
    }
}
@end
