//
//  TableViewItemCellContentView.m
//  template
//
//  Created by Taqtile on 6/2/15.
//  Copyright (c) 2015 Taqtile. All rights reserved.
//

#import "SampleListItemContentChildView.h"
#import "TQTStylesheets.h"

@implementation SampleListItemContentChildView
{
    __weak IBOutlet NSLayoutConstraint *_titleLabelCenterYConstraint;
    __weak IBOutlet NSLayoutConstraint *_titleLabeAlginBottomConstraint;
}

#pragma mark - View Lifecycle
-(void)setupOnAwakeFromNib {
    [self initialSetup];
}

-(void)setupOnInitWithFrame {
    [self initialSetup];
}

- (void)dealloc
{
    [self unregisterForChangeNotification];
}

-(void)initialSetup {
    [self registerAsObserver];
    self.detailLabel.text = @"";
    self.accessoryLabel.text = @"";
}

#pragma mark - Key value observing
- (void)registerAsObserver {
    [self.detailLabel addObserver:self forKeyPath:@"text"
                 options:NSKeyValueObservingOptionNew
                 context:NULL];
}

- (void)unregisterForChangeNotification {
    [self.detailLabel removeObserver:self forKeyPath:@"text"];
}

- (void)observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary *)change
                       context:(void *)context {
    
    if ([keyPath isEqual:@"text"]) {
        [self layoutLabelsConstraintsPriority];
    }
}

- (void)layoutLabelsConstraintsPriority
{
    BOOL const isDetailEmpty = [self.detailLabel.text isEqualToString:@""];
    if (isDetailEmpty) {
        [self verticallyCentralizeTitle];
    } else {
        [self displayDetailUnderTitle];
    }
}

- (void)verticallyCentralizeTitle
{
    _titleLabelCenterYConstraint.priority = UILayoutPriorityDefaultHigh;
    _titleLabeAlginBottomConstraint.priority = UILayoutPriorityDefaultLow;
}

- (void)displayDetailUnderTitle
{
    _titleLabelCenterYConstraint.priority = UILayoutPriorityDefaultLow;
    _titleLabeAlginBottomConstraint.priority = UILayoutPriorityDefaultHigh;
}

#pragma mark - setter
/**
 * This method gets called when the cell is highlighted
 */
-(void)setHighlighted:(BOOL)highlighted {
    _highlighted = highlighted;
    
    TQTStylesheets *shared = [TQTStylesheets sharedInstance];
    [shared setStyle:_highlighted ? @"H4_IsHighlighted_Label" : @"H4_Label" forView:self.titleLabel];
    [shared setStyle:_highlighted ? @"H4Sub_IsHighlighted_Label" : @"H4Sub_Label" forView:self.detailLabel];
    [shared setStyle:_highlighted ? @"TableViewItemCellContentView_AccessoryLabel_IsHighlighted_Label" : @"TableViewItemCellContentView_AccessoryLabel_Label" forView:self.accessoryLabel];
}
@end
