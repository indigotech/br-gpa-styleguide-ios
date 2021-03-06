//
//  UIButton+ButtonStyle.h
//  Schutz
//
//  Created by Taqtile on 2/3/15.
//  Copyright (c) 2015 Taqtile. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (TQTButtonStyle)

@property (strong, nonatomic) UIColor* normalTitleColor;
@property (strong, nonatomic) UIColor* highlightedTitleColor;
@property (strong, nonatomic) UIColor* disabledTitleColor;
@property (strong, nonatomic) UIImage* normalBackgroundImage;
@property (strong, nonatomic) UIImage* highlightedBackgroundImage;
@property (strong, nonatomic) UIImage* disabledBackgroundImage;
@property (strong, nonatomic) NSValue* buttonContentEdgeInsets;
@property (strong, nonatomic) NSValue* buttonTitleEdgeInsets;

@end
