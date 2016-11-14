//
//  Created by Taqtile on 5/5/15.
//  Copyright (c) 2015 Taqtile. All rights reserved.
//

#import "TQTComponentsViewController.h"
#import "TQTGuideTitleView.h"
#import "TQTGuideSubtitleView.h"
#import "TQTMissingMethodImplementationException.h"
#import "Components.h"

@implementation TQTComponentsViewController
{
    __weak IBOutlet UIView *_contentView;
    UIView *_lastAddedView;
}

#pragma mark - abstract methods

/**
 * How to use it:
 * Add your component to this method
 * 1. Instantiate your view component using addViewWithClass:height: or addViewWithDefaultMarginsAndClass:height:
 * 2. Setup the just created view. This setup could be on a separate method and the
 *    the main idea is that it should explain how to configure/fill it with data
 * obs: if you want to add section/subsection titles in this list, call the methods addGuideTitleWithText:/addGuideSubtitleWithText:
 */
-(void)addComponents {
    @throw [[TQTMissingMethodImplementationException alloc] initWithSelector:_cmd];
}

#pragma mark - DON'T CHANGE THE FILE BELOW THIS LINE
#pragma mark - Public
-(UIView *)addViewWithClass:(Class)class height:(CGFloat)height {
    return [self addViewWithTopMargin:DEFAULT_MARGIN rightMargin:0 leftMargin:0 class:class height:height];
}

-(UIView *)addViewWithDefaultMarginsAndClass:(Class)class height:(CGFloat)height {
    return [self addViewWithTopMargin:DEFAULT_MARGIN rightMargin:DEFAULT_MARGIN leftMargin:DEFAULT_MARGIN class:class height:height];
}

-(UIView *)addViewWithTopMargin:(CGFloat)topMargin rightMargin:(CGFloat)rightMargin leftMargin:(CGFloat)leftMargin class:(Class)class height:(CGFloat)height {
    UIView *view = [[class alloc] initWithFrame:CGRectMake(0, 0, _contentView.frame.size.width, height)];
    
    [_contentView addSubview:view];
    [self addConstraintsToView:view withHeight:height topMargin:topMargin rightMargin:rightMargin leftMargin:leftMargin];
    
    _lastAddedView = view;
    
    return view;
}

#pragma mark - VC lifecycle
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setup];
    
    _lastAddedView = nil;
    [self addComponents];
    [self addConstraintToLastAddedView];
}

#pragma mark - private
- (void)setup {
    [self setTitle:@"Styleguide"];
    self.navigationController.navigationBar.translucent = NO;
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemStop target:self action:@selector(didTouchCloseButton:)];
}

/**
 * Add constraints to attach view to the last added view. If it is the first view, it will
 * attach it to the root view
 * @param view view you want to attach
 * @param height height constraint for this view. If you don't want to set a height constraint (in case your view has instrinsic height) then set this param as 0
 * @param topMargin top margin to the parent view
 * @param rightMargin right margin to the container
 * @param leftMargin left margin to the container
 */
- (void)addConstraintsToView:(UIView *)view
                  withHeight:(CGFloat)height
                  topMargin:(CGFloat)topMargin
                  rightMargin:(CGFloat)rightMargin
                  leftMargin:(CGFloat)leftMargin {
    view.translatesAutoresizingMaskIntoConstraints = NO;
    
    NSDictionary *viewsMapping = _lastAddedView ? @{@"view": view, @"lastAddedView": _lastAddedView} : @{@"view": view};
    
    NSString *horizontalConstraintString = [NSString stringWithFormat:@"H:|-%f-[view]-%f-|", leftMargin, rightMargin];
    NSArray *horizontalConstraints = [NSLayoutConstraint constraintsWithVisualFormat:horizontalConstraintString options:0 metrics:nil views:viewsMapping];
    
    NSString *verticalContraintString;
    if (height) {
        NSString * const formatString = _lastAddedView ? @"V:[lastAddedView]-%f-[view(==%f)]" : @"V:|-%f-[view(==%f)]";
        verticalContraintString = [NSString stringWithFormat:formatString, topMargin, height];
    } else {
        NSString * const formatString = _lastAddedView ? @"V:[lastAddedView]-%f-[view]" : @"V:|-%f-[view]";
        verticalContraintString = [NSString stringWithFormat:formatString, topMargin];
    }
    NSArray *verticalConstraints = [NSLayoutConstraint constraintsWithVisualFormat:verticalContraintString  options:0 metrics:nil views:viewsMapping];
    
    [_contentView addConstraints:horizontalConstraints];
    [_contentView addConstraints:verticalConstraints];
}

-(void)addConstraintToLastAddedView {
    if (_lastAddedView) {
        NSDictionary *viewsMapping = @{@"view": _lastAddedView};
        NSArray *verticalConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[view]-|"  options:0 metrics:nil views:viewsMapping];
        [_contentView addConstraints:verticalConstraints];
    }
}

#pragma mark - methods to add title/subtitle
-(void)addGuideTitleWithText:(NSString *)title {
    TQTGuideTitleView *guideTitleView = (TQTGuideTitleView *)[self addViewWithClass:[TQTGuideTitleView class] height:0];
    [guideTitleView setTitle:title];
}

-(void)addGuideSubtitleWithText:(NSString *)subtitle {
    TQTGuideSubtitleView *guideSubtitleView = (TQTGuideSubtitleView *)[self addViewWithClass:[TQTGuideSubtitleView class] height:0];
    [guideSubtitleView setSubtitle:subtitle];
}

#pragma mark - Action
- (void)didTouchCloseButton:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
