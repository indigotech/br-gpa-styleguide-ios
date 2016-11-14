//
//  TAQFormsViewController.m
//  template
//
//  Created by Taqtile on 6/1/15.
//  Copyright (c) 2015 Taqtile. All rights reserved.
//

#import "TQTFormsViewController.h"
#import "SampeNameTextFieldView.h"
#import "TQTCustomPickerView.h"
#import "TQTCustomRadioButtonView.h"
#import "TQTCustomCheckboxButtonView.h"

@interface TQTFormsViewController ()

@end

@implementation TQTFormsViewController

#pragma mark - VC lifecycle
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTitle:@"Forms"];
}

#pragma mark - overriden method
- (void)addComponents {
    [self addNameTextfield];
    [self addPickerView];
    [self addRadioButton];
    [self addCheckboxButton];
}

- (void)addNameTextfield {
    [self addGuideTitleWithText:@"Name textfield"];
    
    [self addComponentWithClass:[SampeNameTextFieldView class] setup:^(UIView *componentView){
        [(SampeNameTextFieldView *)componentView setState:TQTCustomTextFieldViewStateDefault];
    }];
    
    [self addComponentWithClass:[SampeNameTextFieldView class] setup:^(UIView *componentView){
        SampeNameTextFieldView *nameTextFieldView = (SampeNameTextFieldView *)componentView;
        [nameTextFieldView.textField setText:@"Bob"];
        [nameTextFieldView setState:TQTCustomTextFieldViewStateHighlight];
    }];
    
    [self addComponentWithClass:[SampeNameTextFieldView class] setup:^(UIView *componentView){
        SampeNameTextFieldView *nameTextFieldView = (SampeNameTextFieldView *)componentView;
        [nameTextFieldView.textField setText:@"Bob"];
        [nameTextFieldView setState:TQTCustomTextFieldViewStateInactive];
    }];
    
    [self addComponentWithClass:[SampeNameTextFieldView class] setup:^(UIView *componentView){
        SampeNameTextFieldView *nameTextFieldView = (SampeNameTextFieldView *)componentView;
        [nameTextFieldView.textField setText:@"Bob"];
        [nameTextFieldView setState:TQTCustomTextFieldViewStateActive];
    }];
    
    [self addComponentWithClass:[SampeNameTextFieldView class] setup:^(UIView *componentView){
        SampeNameTextFieldView *nameTextFieldView = (SampeNameTextFieldView *)componentView;
        [nameTextFieldView.textField setText:@"132n"];
        [nameTextFieldView setState:TQTCustomTextFieldViewStateError];
    }];
}

- (void)addPickerView {
    [self addGuideTitleWithText:@"Picker"];
    
    [self addComponentWithClass:[TQTCustomPickerView class] setup:^(UIView *componentView){
        [(TQTCustomPickerView *)componentView setState:TQTCustomTextFieldViewStateDefault];
    }];
    
    [self addComponentWithClass:[TQTCustomPickerView class] setup:^(UIView *componentView){
        TQTCustomPickerView *customPickerView = (TQTCustomPickerView *)componentView;
        [customPickerView.textField setText:@"Bob"];
        [customPickerView setState:TQTCustomTextFieldViewStateHighlight];
    }];
    
    [self addComponentWithClass:[TQTCustomPickerView class] setup:^(UIView *componentView){
        TQTCustomPickerView *customPickerView = (TQTCustomPickerView *)componentView;
        [customPickerView.textField setText:@"Bob"];
        [customPickerView setState:TQTCustomTextFieldViewStateInactive];
    }];
    
    [self addComponentWithClass:[TQTCustomPickerView class] setup:^(UIView *componentView){
        TQTCustomPickerView *customPickerView = (TQTCustomPickerView *)componentView;
        [customPickerView.textField setText:@"Bob"];
        [customPickerView setState:TQTCustomTextFieldViewStateActive];
    }];
    
    [self addComponentWithClass:[TQTCustomPickerView class] setup:^(UIView *componentView){
        TQTCustomPickerView *customPickerView = (TQTCustomPickerView *)componentView;
        [customPickerView setState:TQTCustomTextFieldViewStateError];
    }];
}

- (void)addRadioButton {
    [self addGuideTitleWithText:@"Radio button"];
    
    [self addComponentWithClass:[TQTCustomRadioButtonView class] setup:nil];
    
    [self addComponentWithClass:[TQTCustomRadioButtonView class] setup:^(UIView *componentView){
        [(TQTCustomRadioButtonView *)componentView setSelected:YES];
    }];
    
    [self addComponentWithClass:[TQTCustomRadioButtonView class] setup:^(UIView *componentView){
        TQTCustomRadioButtonView *customRadioButtonView = (TQTCustomRadioButtonView *)componentView;
        [customRadioButtonView setSelected:NO];
        [customRadioButtonView setState:TQTCustomRadioButtonViewStateInactive];
    }];
    
    [self addComponentWithClass:[TQTCustomRadioButtonView class] setup:^(UIView *componentView){
        TQTCustomRadioButtonView *customRadioButtonView = (TQTCustomRadioButtonView *)componentView;
        [customRadioButtonView setSelected:YES];
        [customRadioButtonView setState:TQTCustomRadioButtonViewStateInactive];
    }];
}

- (void)addCheckboxButton {
    [self addGuideTitleWithText:@"Checkbox button"];
    
    [self addComponentWithClass:[TQTCustomCheckboxButtonView class] setup:nil];
    
    [self addComponentWithClass:[TQTCustomCheckboxButtonView class] setup:^(UIView *componentView){
        [(TQTCustomCheckboxButtonView *)componentView setSelected:YES];
    }];
    
    [self addComponentWithClass:[TQTCustomCheckboxButtonView class] setup:^(UIView *componentView){
        TQTCustomCheckboxButtonView *customRadioButtonView = (TQTCustomCheckboxButtonView *)componentView;
        [customRadioButtonView setSelected:NO];
        [customRadioButtonView setState:TQTCustomCheckboxButtonViewStateInactive];
    }];
    
    [self addComponentWithClass:[TQTCustomCheckboxButtonView class] setup:^(UIView *componentView){
        TQTCustomCheckboxButtonView *customRadioButtonView = (TQTCustomCheckboxButtonView *)componentView;
        [customRadioButtonView setSelected:YES];
        [customRadioButtonView setState:TQTCustomCheckboxButtonViewStateInactive];
    }];
}

#pragma mark - Aux methods
- (void)addComponentWithClass:(Class)class setup:(void (^)(UIView *componentView))setup {
     UIView *componentView = [self addViewWithDefaultMarginsAndClass:class height:0];
    if (setup) setup(componentView);
}
@end