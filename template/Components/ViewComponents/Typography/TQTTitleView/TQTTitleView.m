//
//  TitleView.m
//  template
//
//  Created by Taqtile on 5/20/15.
//  Copyright (c) 2015 Taqtile. All rights reserved.
//

#import "TQTTitleView.h"

@implementation TQTTitleView
{
    __weak IBOutlet UILabel *_titleLabel;
}

-(void)setupOnInitWithFrame{}
-(void)setupOnAwakeFromNib{}

-(void)setTitle: (NSString *)title {
    _titleLabel.text = title;
}

@end
