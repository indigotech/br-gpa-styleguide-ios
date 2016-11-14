//
//  CustomCheckboxButton.h
//  template
//
//  Created by Taqtile on 6/2/15.
//  Copyright (c) 2015 Taqtile. All rights reserved.
//

#import "TQTBaseComponentsView.h"

typedef enum : NSUInteger {
    TQTCustomCheckboxButtonViewStateActive,
    TQTCustomCheckboxButtonViewStateInactive,
} TQTCustomCheckboxButtonViewState;

/**
 * Implementation of a checkbox using UIButton
 */
@interface TQTCustomCheckboxButtonView : TQTBaseComponentsView
@property (nonatomic) BOOL selected;
@property (nonatomic) TQTCustomCheckboxButtonViewState state;
@end
