//
//  Colors.h
//  template
//
//  Created by Taqtile on 5/19/15.
//  Copyright (c) 2015 Taqtile. All rights reserved.
//

// This file is used to set constants for colors. Each color constant
// should be defined in the hexadecimal format
//
// ex:
// #define COLOR_PRIMARY             0x5B2B85

// To get a UIColor in your code, use the macro UICOLOR_FROM_HEXA or
// UICOLOR_FROM_HEX
//
// ex:
// myView.backgroundColor = UICOLOR_FROM_HEX(COLOR_PRIMARY);

// TO get a highlighted or disabled scale of a color, use the macro UICOLOR_HIGHLIGHTED_FROM_HEXA or
// UICOLOR_HIGHLIGHTED_FROM_HEX, UICOLOR_DISABLED_FROM_HEX, UICOLOR_DISABLED_FROM_HEX
//
// ex:
// UICOLOR_DISABLED_FROM_HEX(COLOR_SWATCH_PRIMARY)

#ifndef template_Colors_h
#define template_Colors_h

// Get RGB components from HEX macros
#define BLUE_FROM_HEX(hexValue)  ((float)(hexValue & 0xFF))
#define GREEN_FROM_HEX(hexValue) ((float)((hexValue & 0xFF00) >> 8))
#define RED_FROM_HEX(hexValue)  ((float)((hexValue & 0xFF0000) >> 16))
#define ALPHA_FROM_HEX(hexValue) (((float)((hexValue & 0xFF000000) >> 24))/255)

// alpha compositing macro http://en.wikipedia.org/wiki/Alpha_compositing
#define ALPHA_COMPOSITING(hexValue,a, mask)                     \
    [UIColor colorWithRed:(RED_FROM_HEX(mask) * ALPHA_FROM_HEX(mask) + RED_FROM_HEX(hexValue) * a * (1 - ALPHA_FROM_HEX(mask)))/255.0 \
                    green:(GREEN_FROM_HEX(mask) * ALPHA_FROM_HEX(mask) + GREEN_FROM_HEX(hexValue) * a * (1 - ALPHA_FROM_HEX(mask)))/255.0 \
                     blue:(BLUE_FROM_HEX(mask) * ALPHA_FROM_HEX(mask) + BLUE_FROM_HEX(hexValue) * a * (1 - ALPHA_FROM_HEX(mask)))/255.0 \
                    alpha:a]

// get UIColor macros
#define UICOLOR_FROM_HEXA(hexValue,a)                                \
    [UIColor colorWithRed:(RED_FROM_HEX(hexValue))/255.0     \
                    green:(GREEN_FROM_HEX(hexValue))/255.0    \
                     blue:(BLUE_FROM_HEX(hexValue))/255.0     \
                    alpha:a]
#define UICOLOR_FROM_HEX(hexValue) (UICOLOR_FROM_HEXA(hexValue, 1))

#define UICOLOR_HIGHLIGHTED_FROM_HEXA(hexValue, a) (ALPHA_COMPOSITING(hexValue, a, COLOR_MASK_HIGHLIGHTED))
#define UICOLOR_HIGHLIGHTED_FROM_HEX(hexValue) (UICOLOR_HIGHLIGHTED_FROM_HEXA(hexValue, 1))

#define UICOLOR_DISABLED_FROM_HEXA(hexValue, a) (ALPHA_COMPOSITING(hexValue, a, COLOR_MASK_DISABLED))
#define UICOLOR_DISABLED_FROM_HEX(hexValue) (UICOLOR_DISABLED_FROM_HEXA(hexValue, 1))

// Pallette
#define COLOR_PRIMARY          0x16AAE4
#define COLOR_SECONDARY        0xED3E78
#define COLOR_ACCESSORY        0x48CFAD
#define COLOR_ALERT            0xDA4453
#define COLOR_SUCCESS          0xA4CF56
#define COLOR_CALL_TO_ACTION   0xFC6E51

// Grayscale
#define COLOR_GRAY_DARKEST     0x4A4A4A
#define COLOR_GRAY_DARKER      0x646464
#define COLOR_GRAY             0x727272
#define COLOR_GRAY_LIGHTER     0x9B9B9B
#define COLOR_GRAY_LIGHTEST    0xCCCCCC

// Black and white
#define COLOR_BLACK            0x000000
#define COLOR_WHITE            0xFFFFFF

// Mask
#define COLOR_MASK_DISABLED    0x66FFFFFF
#define COLOR_MASK_HIGHLIGHTED 0x33000000 


#endif
