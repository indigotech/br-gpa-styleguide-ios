//
//  CustomPickerView.m
//  template
//
//  Created by Taqtile on 6/1/15.
//  Copyright (c) 2015 Taqtile. All rights reserved.
//

#import "TQTCustomPickerView.h"
#import "TQTFormTextualElementsStylesheet.h"

@implementation TQTCustomPickerView
{
    UIPickerView *_pickerView;
}

#pragma mark - View lifecycle
-(void)setupOnAwakeFromNib {
    [self initialSetup];
}

-(void)setupOnInitWithFrame {
    [self initialSetup];
}

-(void)dealloc {
    [_pickerView removeFromSuperview];
    _pickerView = nil;
}

-(void)initialSetup {
    self.fieldNameLabel.text = @"Picker";
    NSDictionary *attributes = [TQTFormTextualElementsStylesheet attributedStringAttributes][@"InputPlaceholder"];
    self.textField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Select" attributes:attributes];
    [self.textFieldButton setTitle:@"" forState:UIControlStateNormal];
    self.captionLabel.text = @"";
    [self.textFieldButton setImage:[[UIImage imageNamed:@"ic-textfield_picker"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate] forState:UIControlStateNormal];
    [self.textFieldButton addTarget:self action:@selector(didTouchPickerButton) forControlEvents:UIControlEventTouchUpInside];
    
    _pickerView = [[UIPickerView alloc] init];
    [self.window addSubview:_pickerView];
    
    self.textField.inputView = _pickerView;
}

#pragma mark - Action
-(void)didTouchPickerButton {
    [self.textField becomeFirstResponder];
}

#pragma mark - Override
-(NSString *)nibName {
    return [[TQTCustomTextFieldView class] description];
}

-(void)setState:(TQTCustomTextFieldViewState)state {
    [super setState:state];
    switch (state) {
        case TQTCustomTextFieldViewStateError:
            break;
        case TQTCustomTextFieldViewStateActive:
            break;
        case TQTCustomTextFieldViewStateDefault:
            break;
        case TQTCustomTextFieldViewStateInactive:
            break;
        case TQTCustomTextFieldViewStateHighlight:
            break;
        default:
            break;
    }
}
@end
