//
//  CustomRadioButtonView.m
//  template
//
//  Created by Taqtile on 6/2/15.
//  Copyright (c) 2015 Taqtile. All rights reserved.
//

#import "TQTCustomRadioButtonView.h"

@implementation TQTCustomRadioButtonView
{
    __weak IBOutlet UIButton *_button;
}

#pragma mark - View lifecycle
-(void)setupOnAwakeFromNib {
    [self initialSetup];
}

-(void)setupOnInitWithFrame {
    [self initialSetup];
}

-(void)initialSetup {
    self.state = TQTCustomRadioButtonViewStateActive;
    self.selected = NO;
}

#pragma mark - setter
-(void)setState:(TQTCustomRadioButtonViewState)state {
    _state = state;
    switch (state) {
        case TQTCustomRadioButtonViewStateActive:
            [_button setEnabled:YES];
            break;
        case TQTCustomRadioButtonViewStateInactive:
            [_button setEnabled:NO];
            break;
        default:
            [self setState:TQTCustomRadioButtonViewStateActive];
            break;
    }
}

-(void)setSelected:(BOOL)selected {
    _selected = selected;
    [_button setTitle:@"Input value" forState:UIControlStateNormal];
    [_button setImage:[[UIImage imageNamed:selected ? @"ic-radio_is_selected" : @"ic-radio"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate] forState:UIControlStateNormal];
}
@end
