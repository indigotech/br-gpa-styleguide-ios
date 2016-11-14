//
//  HomeViewController.m
//  template
//
//  Created by Tqt iOS on 5/19/2015.
//  Copyright (c) 2015 Taqtile. All rights reserved.
//

#import "HomeViewController.h"
#import "TQTTitleView.h"
#import "Components.h"

#ifdef ENV_DEVELOPMENT
#import "TQTGuideViewController.h"
#endif

@interface HomeViewController ()

@end

@implementation HomeViewController
{
    __weak IBOutlet TQTTitleView *_titleLabel;
}

#pragma mark - ViewController lifecyle
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setup];
}

#pragma mark - setup
-(void)setup {
    [self setTitle:@"Template"];
    
    self.navigationController.navigationBar.translucent = NO;
    [self.navigationController.navigationBar setBarTintColor:NAVIGATION_BAR_TINT_COLOR];
    
    NSDictionary * const titleAttributes = @{NSForegroundColorAttributeName:UICOLOR_FROM_HEX(COLOR_WHITE), NSFontAttributeName:[UIFont fontWithName:NAVIGATION_BAR_FONT size:FONT_SIZE_EXTRA_LARGE]};
    [self.navigationController.navigationBar setTitleTextAttributes:titleAttributes];
    
    #ifdef ENV_DEVELOPMENT
        [self setupComponentsButton];
    #endif
    
    [_titleLabel setTitle:@"H2 - Heading 2"];
}

#pragma mark - Components button

#ifdef ENV_DEVELOPMENT
- (void)setupComponentsButton {
    UIButton *componentsVCButton = [[UIButton alloc] init];
    [componentsVCButton addTarget:self
                           action:@selector(didTouchUpComponentsButton:)
                 forControlEvents:UIControlEventTouchUpInside];
    [componentsVCButton setTitle:@"C" forState:UIControlStateNormal];
    [componentsVCButton setTitleColor:[UIColor purpleColor] forState:UIControlStateNormal];
    [self.view addSubview:componentsVCButton];
    componentsVCButton.translatesAutoresizingMaskIntoConstraints = NO;
    NSDictionary *viewMapping = @{@"view": componentsVCButton};
    NSArray *horizontalConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"H:[view(==48)]|" options:0 metrics:nil views:viewMapping];
    NSArray *verticalConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[view(==48)]|" options:0 metrics:nil views:viewMapping];
    [self.view addConstraints:horizontalConstraints];
    [self.view addConstraints:verticalConstraints];
}

- (void)didTouchUpComponentsButton:(UIButton *)sender {
    TQTGuideViewController *vc = [[TQTGuideViewController alloc] initWithNibName:nil bundle:nil];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
    [self presentViewController:nav animated:YES completion:nil];
}
#endif

@end
