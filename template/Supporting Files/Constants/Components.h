//
//  Components.h
//  template
//
//  Created by Taqtile on 5/19/15.
//  Copyright (c) 2015 Taqtile. All rights reserved.
//
// This file concerns UI constants for UI configurations.
// This file should be used when it is not possible to style an element by using the stylesheet
// or when you need some auxiliary constants regarding the style
//
// All component constants in this file use the following pattern (in eBNF):
// component_name + [sub_component_name] + ["_TYPE_" type_name] + ["_IS_" state_name] + "_" + attribute_name
#import "Colors.h"
#import "Fonts.h"

#ifndef template_Components_h
#define template_Components_h

// Auxiliary style constants
#define BORDER_SMALL_WIDTH 1
#define CORNER_RADIUS      4
#define DEFAULT_MARGIN     8

// Auxiliary animation constants
#define ANIMATION_IMAGE_FADE_IN_DURATION 0.3

// Component constants
#define NAVIGATION_BAR_TINT_COLOR UICOLOR_FROM_HEX(COLOR_PRIMARY)
#define NAVIGATION_BAR_FONT       FONT_NAME(FONT_FAMILY_PRIMARY, FONT_WEIGHT_REGULAR)

#endif
