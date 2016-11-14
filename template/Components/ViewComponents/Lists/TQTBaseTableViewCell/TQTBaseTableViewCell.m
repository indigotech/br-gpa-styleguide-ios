//
//  BaseTableViewCell.m
//  template
//
//  Created by Taqtile on 6/3/15.
//  Copyright (c) 2015 Taqtile. All rights reserved.
//

#import "TQTBaseTableViewCell.h"
#import "TQTNullContentChildViewClassException.h"
#import "UIView+TQTAttachToSuperview.h"

@interface TQTBaseTableViewCell()

@property (nonatomic, strong, readwrite) UIView *contentChildView; 

@end

@implementation TQTBaseTableViewCell
-(UIView *)contentChildView {
    _contentChildView = self.contentView.subviews.firstObject;
    if (!_contentChildView) {
        if (!self.contentChildViewClass) {
            @throw [[TQTNullContentChildViewClassException alloc] init];
        }
        _contentChildView = [[self.contentChildViewClass alloc] initWithFrame:CGRectZero];
        [self.contentView addSubview:_contentChildView];
        [_contentChildView attachToSuperviewUsingConstraints];
    }
    return _contentChildView;
}
@end
