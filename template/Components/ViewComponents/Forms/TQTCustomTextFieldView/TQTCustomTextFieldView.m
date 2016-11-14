//
//  CustomTextFieldView.m
//  template
//
//  Created by Taqtile on 6/1/15.
//  Copyright (c) 2015 Taqtile. All rights reserved.
//

#import "TQTCustomTextFieldView.h"
#import "TQTStylesheets.h"

@implementation TQTCustomTextFieldView

-(void)awakeFromNib {
    [self setState:TQTCustomTextFieldViewStateDefault];
    [self setupOnAwakeFromNib];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setState:TQTCustomTextFieldViewStateDefault];
        [self setupOnInitWithFrame];
    }
    return self;
}

-(void)setState:(TQTCustomTextFieldViewState)state {
    switch (state) {
        case TQTCustomTextFieldViewStateError:
            [self errorStateSetup];
             break;
        case TQTCustomTextFieldViewStateActive:
            [self activeStateSetup];
            break;
        case TQTCustomTextFieldViewStateDefault:
            [self defaultSetup];
            break;
        case TQTCustomTextFieldViewStateInactive:
            [self inactiveStateSetup];
             break;
            break;
        case TQTCustomTextFieldViewStateHighlight:
            [self highlightStateSetup];
            break;
        default:
            break;
    }
}

#pragma mark - state setup methods
- (void)defaultSetup {
    TQTStylesheets *shared = [TQTStylesheets sharedInstance];
    [shared setStyle:@"Label_Label" forView:self.fieldNameLabel];
    [shared setStyle:@"CustomTextFieldView_TextField_View" forView:self.textFieldContainerView];
    [shared setStyle:@"InputValue_TextField" forView:self.textField];
    [shared setStyle:@"CustomTextFieldView_Button" forView:self.textFieldButton];
    [shared setStyle:@"Caption_Label" forView:self.captionLabel];
}

- (void)errorStateSetup {
    TQTStylesheets *shared = [TQTStylesheets sharedInstance];
    [shared setStyle:@"Label_IsError_Label" forView:self.fieldNameLabel];
    [shared setStyle:@"CustomTextFieldView_TextField_IsError_View" forView:self.textFieldContainerView];
    [shared setStyle:@"InputValue_IsError_TextField" forView:self.textField];
    [shared setStyle:@"Caption_IsError_Label" forView:self.captionLabel];
    [shared setStyle:@"CustomTextFieldView_IsError_Button" forView:self.textFieldButton];
}

- (void)activeStateSetup {
    [self.textFieldButton setImage:[UIImage imageNamed:@"ic-textfield_delete"] forState:UIControlStateNormal];
    [self defaultSetup];
}

- (void)inactiveStateSetup {
    TQTStylesheets *shared = [TQTStylesheets sharedInstance];
    [shared setStyle:@"Label_IsInactive_Label" forView:self.fieldNameLabel];
    [shared setStyle:@"CustomTextFieldView_TextField_IsInactive_View" forView:self.textFieldContainerView];
    [shared setStyle:@"InputValue_IsInactive_TextField" forView:self.textField];
    [shared setStyle:@"Caption_IsInactive_Label" forView:self.captionLabel];
    [shared setStyle:@"CustomTextFieldView_IsInactive_Button" forView:self.textFieldButton];
}

- (void)highlightStateSetup {
    [self defaultSetup];
    [self.textFieldButton setImage:[UIImage imageNamed:@"ic-textfield_success"] forState:UIControlStateNormal];
}

@end
