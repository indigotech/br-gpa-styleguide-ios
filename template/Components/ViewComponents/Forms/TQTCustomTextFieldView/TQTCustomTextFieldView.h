//
//  CustomTextFieldView.h
//  template
//
//  Created by Taqtile on 6/1/15.
//  Copyright (c) 2015 Taqtile. All rights reserved.
//

#import "TQTBaseComponentsView.h"

typedef enum : NSUInteger {
    TQTCustomTextFieldViewStateDefault,
    TQTCustomTextFieldViewStateActive,
    TQTCustomTextFieldViewStateInactive,
    TQTCustomTextFieldViewStateError,
    TQTCustomTextFieldViewStateHighlight,
} TQTCustomTextFieldViewState;

@interface TQTCustomTextFieldView : TQTBaseComponentsView

@end

/**
 * Implementation of a textfield
 * New kinds of textfield should inherit from this class. 
 * This is useful to set new label, placeholder, error messages or
 * other behaviour
 */
@interface TQTCustomTextFieldView()
@property (weak, nonatomic) IBOutlet UILabel *fieldNameLabel;
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UIButton *textFieldButton;
@property (weak, nonatomic) IBOutlet UILabel *captionLabel;
@property (weak, nonatomic) IBOutlet UIView *textFieldContainerView;
-(void)setState:(TQTCustomTextFieldViewState)state;
@end
