//
//  BaseView.m
//  Netshoes
//
//  Created by Indigo on 4/24/15.
//  Copyright (c) 2015 Taqtile. All rights reserved.
//

#import "TQTBaseComponentsView.h"
#import "UIView+TQTAttachToSuperview.h"
#import "TQTMissingMethodImplementationException.h"

@implementation TQTBaseComponentsView

- (void)awakeFromNib
{
    [super awakeFromNib];
    [self addContentViewWithConstraints];
    [self setupOnAwakeFromNib];
}

-(instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self addContentViewWithConstraints];
        [self setupOnInitWithFrame];
    }
    return self;
}

-(void) addContentViewWithConstraints
{
    UIView * contentView;
    @try {
        contentView = [[[NSBundle mainBundle] loadNibNamed:[[self class] description] owner:self options:nil] firstObject];
    }
    @catch (NSException *exception) {
        NSString * const cantLoadNibExceptionName = NSInternalInconsistencyException;
        if ([exception.name isEqualToString:cantLoadNibExceptionName]) {
            contentView = [[[NSBundle mainBundle] loadNibNamed:[self nibName] owner:self options:nil] firstObject];
        } else {
            @throw exception;
        }
    }
    
    [self addSubview:contentView];
    [contentView attachToSuperviewUsingConstraints];
}

#pragma mark - Abstract methods
- (void)setupOnInitWithFrame {
    @throw [[TQTMissingMethodImplementationException alloc] initWithSelector:_cmd];
}

- (void)setupOnAwakeFromNib {
    @throw [[TQTMissingMethodImplementationException alloc] initWithSelector:_cmd];
}

/**
 * Method to be overriden in case you need to have an specific nib for a class which has a differente name from 
 * the class name
 */
-(NSString *)nibName {
    @throw [[TQTMissingMethodImplementationException alloc] initWithSelector:_cmd];
}
@end
