//
//  CustomRadioButtonView.h
//  template
//
//  Created by Taqtile on 6/2/15.
//  Copyright (c) 2015 Taqtile. All rights reserved.
//

#import "TQTBaseComponentsView.h"

typedef enum : NSUInteger {
    TQTCustomRadioButtonViewStateActive,
    TQTCustomRadioButtonViewStateInactive,
} TQTCustomRadioButtonViewState;

/**
 * Implementation of a radio button using UIButton
 */
@interface TQTCustomRadioButtonView : TQTBaseComponentsView
@property (nonatomic) BOOL selected;
@property (nonatomic) TQTCustomRadioButtonViewState state;
@end
